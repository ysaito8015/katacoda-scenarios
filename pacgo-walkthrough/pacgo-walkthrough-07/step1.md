## Overview

`cd /work/pacgo`{{execute}}

So, we've managed to create a proper game in the terminal. But I've promised emojis, where are they? Well, the time has come, finally!

In this step we will create a file called `config.json`. In this file we will store mappings for each symbol we use in our game. In 2D games, we usually call the moving pieces "sprites".

Since most of the terminals nowadays support unicode, we can use emojis as our sprites without needing to resort to any graphical library.

The provided `config.json` file should look like this:

`touch /work/pacgo/config.json`{{execute}}

<pre class="file" data-filename="/work/pacgo/config.json" data-target="replace">
{
    "player": "😋",
    "ghost": "👻",
    "wall": "🌵",
    "dot": "🧀",
    "pill": "🍹",
    "death": "💀",
    "space": "  ",
    "use_emoji": true
}
</pre>

This is the default mapping but please feel free to toy with the entire emoji palette. We have inifinte possibilities!

One important aspect about the config file is the `use_emoji` configuration. We are using this flag to signal to the game when we are using emojis. This is necessary because emojis generally use more than one character in the screen (most of them use 2).

Using that flag we can have alternate code paths that make adjustments to compensate that difference. Otherwise the maze would look distorted.


## Task 01: Load a json

Go has support for loading json on the standard library.

We first need to define a struct to hold the json data. The text between the backticks (\`) is called a `struct tag`. It is used by the json decoder to know which field of the struct corresponds to each field in the json file.

```go
// Config holds the emoji configuration
type Config struct {
  Player   string `json:"player"`
  Ghost    string `json:"ghost"`
  Wall     string `json:"wall"`
  Dot      string `json:"dot"`
  Pill     string `json:"pill"`
  Death    string `json:"death"`
  Space    string `json:"space"`
  UseEmoji bool   `json:"use_emoji"`
}

var cfg Config
```

Note that we used public members for the `Config` struct. That is required for the json decoder to work.

The code below parses the json and stores it in the `cfg` global variable.

```go
func loadConfig() error {
  f, err := os.Open("config.json")
  if err != nil {
    return err
  }
  defer f.Close()

  decoder := json.NewDecoder(f)
  err = decoder.Decode(&cfg)
  if err != nil {
    return err
  }

  return nil
}
```

Now add the `loadConfig` call in the initialization part of the main function, after `loadMaze`:

```go
  err = loadConfig()
  if err != nil {
    log.Printf("Error loading configuration: %v\n", err)
    return
    }
```

<pre class="file" data-filename="/work/pacgo/main.go" data-target="replace">
package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"time"
)

// Player is the player character \o/
type Player struct {
	row int
	col int
}

var player Player

// Ghost is the enemy that chases the player :O
type Ghost struct {
	row int
	col int
}

var ghosts []*Ghost

// Config holds the emoji configuration
type Config struct {
	Player   string `json:"player"`
	Ghost    string `json:"ghost"`
	Wall     string `json:"wall"`
	Dot      string `json:"dot"`
	Pill     string `json:"pill"`
	Death    string `json:"death"`
	Space    string `json:"space"`
	UseEmoji bool   `json:"use_emoji"`
}

var cfg Config

func loadConfig() error {
	f, err := os.Open("config.json")
	if err != nil {
		return err
	}
	defer f.Close()

	decoder := json.NewDecoder(f)
	err = decoder.Decode(&cfg)
	if err != nil {
		return err
	}

	return nil
}

func loadMaze() error {
	f, err := os.Open("maze01.txt")
	if err != nil {
		return err
	}
	defer f.Close()

	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		line := scanner.Text()
		maze = append(maze, line)
	}

	for row, line := range maze {
		for col, char := range line {
			switch char {
			case 'P':
				player = Player{row, col}
			case 'G':
				ghosts = append(ghosts, &Ghost{row, col})
			case '.':
				numDots++
			}
		}
	}

	return nil
}

var maze []string
var score int
var numDots int
var lives = 1

func clearScreen() {
	fmt.Printf("\x1b[2J")
	moveCursor(0, 0)
}

func moveCursor(row, col int) {
	fmt.Printf("\x1b[%d;%df", row+1, col+1)
}

func printScreen() {
	clearScreen()
	for _, line := range maze {
		for _, chr := range line {
			switch chr {
			case '#':
				fallthrough
			case '.':
				fmt.Printf("%c", chr)
			default:
				fmt.Printf(" ")
			}
		}
		fmt.Printf("\n")
	}

	moveCursor(player.row, player.col)
	fmt.Printf("P")

	for _, g := range ghosts {
		moveCursor(g.row, g.col)
		fmt.Printf("G")
	}

	moveCursor(len(maze)+1, 0)
	fmt.Printf("Score: %v\tLives: %v\n", score, lives)
}

func readInput() (string, error) {
	buffer := make([]byte, 100)

	cnt, err := os.Stdin.Read(buffer)
	if err != nil {
		return "", err
	}

	if cnt == 1 && buffer[0] == 0x1b {
		return "ESC", nil
	} else if cnt >= 3 {
		if buffer[0] == 0x1b && buffer[1] == '[' {
			switch buffer[2] {
			case 'A':
				return "UP", nil
			case 'B':
				return "DOWN", nil
			case 'C':
				return "RIGHT", nil
			case 'D':
				return "LEFT", nil
			}
		}
	}

	return "", nil
}

func makeMove(oldRow, oldCol int, dir string) (newRow, newCol int) {
	newRow, newCol = oldRow, oldCol

	switch dir {
	case "UP":
		newRow = newRow - 1
		if newRow < 0 {
			newRow = len(maze) - 1
		}
	case "DOWN":
		newRow = newRow + 1
		if newRow == len(maze)-1 {
			newRow = 0
		}
	case "RIGHT":
		newCol = newCol + 1
		if newCol == len(maze[0]) {
			newCol = 0
		}
	case "LEFT":
		newCol = newCol - 1
		if newCol < 0 {
			newCol = len(maze[0]) - 1
		}
	}

	if maze[newRow][newCol] == '#' {
		newRow = oldRow
		newCol = oldCol
	}

	return
}

func movePlayer(dir string) {
	player.row, player.col = makeMove(player.row, player.col, dir)
	switch maze[player.row][player.col] {
	case '.':
		numDots--
		score++
		// Remove dot from the maze
		maze[player.row] = maze[player.row][0:player.col] + " " + maze[player.row][player.col+1:]
	}
}

func drawDirection() string {
	dir := rand.Intn(4)
	move := map[int]string{
		0: "UP",
		1: "DOWN",
		2: "RIGHT",
		3: "LEFT",
	}
	return move[dir]
}

func moveGhosts() {
	for _, g := range ghosts {
		dir := drawDirection()
		g.row, g.col = makeMove(g.row, g.col, dir)
	}
}

func initialize() {
	cbTerm := exec.Command("/bin/stty", "cbreak", "-echo")
	cbTerm.Stdin = os.Stdin

	err := cbTerm.Run()
	if err != nil {
		log.Fatalf("Unable to activate cbreak mode terminal: %v\n", err)
	}
}

func cleanup() {
	cookedTerm := exec.Command("/bin/stty", "-cbreak", "echo")
	cookedTerm.Stdin = os.Stdin

	err := cookedTerm.Run()
	if err != nil {
		log.Fatalf("Unable to activate cooked mode terminal: %v\n", err)
	}
}

func main() {
	// initialize game
	initialize()
	defer cleanup()

	// load resources
	err := loadMaze()
	if err != nil {
		log.Printf("Error loading maze: %v\n", err)
		return
	}

	err = loadConfig()
	if err != nil {
		log.Printf("Error loading configuration: %v\n", err)
		return
	}

	// process input (async)
	input := make(chan string)
	go func(ch chan<- string) {
		for {
			input, err := readInput()
			if err != nil {
				log.Printf("Error reading input: %v", err)
				ch <- "ESC"
			}
			ch <- input
		}
	}(input)

	// game loop
	for {
		// process movement
		select {
		case inp := <-input:
			if inp == "ESC" {
				lives = 0
			}
			movePlayer(inp)
		default:
		}

		moveGhosts()

		// process collisions
		for _, g := range ghosts {
			if player.row == g.row && player.col == g.col {
				lives = 0
			}
		}

		// update screen
		printScreen()

		// check game over
		if numDots == 0 || lives == 0 {
			break
		}

		// repeat
		time.Sleep(200 * time.Millisecond)
	}
}
</pre>
