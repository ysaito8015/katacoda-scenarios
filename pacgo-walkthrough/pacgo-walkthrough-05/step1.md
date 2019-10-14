## Overview

We are almost there. We have both player movement and ghost movement. But our ghosts are still inoffensive. 

It's time to add some danger to this game. Also, with great risks should come great rewards, so we will be also tackling the game win condition, by clearing the board of all its dots.

`cd /work/pacgo`{{execute}}

## Task 01: Preparation

For the game win condition we need to keep track of how many dots we have on the board, and declare win when this number is zero.

We will need a mechanic to remove the dots from the board once the player stands over them. We will also keep track of a score to show the player.

For the game over scenario, we will be giving the player one life and when a ghost hits them this life is zeroed. We then test for zero lives in the game loop to terminate the game. (It should be pretty straightforward to add support for multiple lives, but we will do this at a later step).

Add the following global variables to track all of the above:

```go
var score int
var numDots int
var lives = 1
```

Next, we need to initialize the `numDots` variable in `loadMaze`. We just need a new case in the switch that handles the `.` character:

```go
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
```

Now we need to update the `printScreen` function to print the dots again. This is an interesting case for the `fallthrough` statement:

```go
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
    // rest of the function omitted for brevity...
}
```

Finally, at the end of the `printScreen` function let's add our score and lives panel:

```go
func printScreen() {
    // code omitted...

    // print score
    moveCursor(len(maze)+1, 0)
    fmt.Printf("Score: %v\nLives: %v\n", score, lives)
}
```

<pre class="file" data-filename="/work/pacgo/main.go" data-target="replace">
package main

import (
	"bufio"
	"fmt"
	"log"
	"math/rand"
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

	// print score
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
		moveGhosts()

		// process collisions

		// check game over
		if input == "ESC" {
			break
		}

		// repeat
	}
}
</pre>
