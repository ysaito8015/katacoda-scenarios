## Overview

Now that we can move our player, it's time to do something about our enemies (ghosts).

We will use the same move mechanic as the player one, the `makeMove` function, but instead of reading input from the keyboard we will use a simple algorithm: generate a random number between 0 and 3 and assign a direction to each of those values.

If the Ghost hits a wall it doesn't matter, it will just try again on the next iteration.

`cd /work/pacgo`{{execute}}

## Task 01: Task 01: Making Ghosts

Just like we've created a struct to hold our player data, we will create a similar one for ghosts. The only difference is that instead of holding a player global variable in memory we will have a slice of pointers to Ghosts. That way we can update each ghosts position in a very efficient way.

First, the declaration:

```go
// Ghost is the enemy that chases the player :O
type Ghost struct {
    row int
    col int
}

var ghosts []*Ghost
```

Note the `*` symbol denoting that `[]*Ghost` is a slice of **pointers** to Ghost objects.

Next, loading. In the `loadMaze` function, add a new case to the switch statement for handling `G` symbols on the map:

```go
for row, line := range maze {
    for col, char := range line {
        switch char {
        case 'P':
            player = Player{row, col}
        case 'G':
            ghosts = append(ghosts, &Ghost{row, col})
        }
    }
}
```

Please note the ampersand (`&`) operator. This means that instead of adding a Ghost object to the slice we are adding a pointer to it.

Go is a garbage collected language, which means it can automatically de-allocate a piece of memory when it is no longer used. Because of that we can use pointers in a much safer way than, for instance, in C++. We are also not allowed to do math on pointers. In effect, a pointer in Go works almost like a reference.

Now, since we are handling `G`s in the `loadMaze` function we also need to print them in `printScreen`. Just add the following block after printing the player:

```go
for _, g := range ghosts {
    moveCursor(g.row, g.col)
    fmt.Printf("G")
}
```

<pre class="file" data-filename="/work/pacgo/main.go" data-target="replace">
package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"os/exec"
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
			}
		}
	}

	return nil
}

var maze []string

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
				fmt.Printf("%c", chr)
			default:
				fmt.Printf(" ")
			}
		}
		fmt.Printf("\n")
	}

	moveCursor(player.row, player.col)
	fmt.Printf("P")

	moveCursor(len(maze)+1, 0)
	fmt.Printf("Row %v Col %v", player.row, player.col)
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
}

func init() {
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
	defer cleanup()

	// load resources
	err := loadMaze()
	if err != nil {
		log.Printf("Error loading maze: %v\n", err)
		return
	}

	// game loop
	for {
		// update screen
		printScreen()

		// process input
		input, err := readInput()
		if err != nil {
			log.Printf("Error reading input: %v", err)
			break
		}

		// process movement
		movePlayer(input)

		// process collisions

		// check game over
		if input == "ESC" {
			break
		}

		// repeat
	}
}
</pre>
