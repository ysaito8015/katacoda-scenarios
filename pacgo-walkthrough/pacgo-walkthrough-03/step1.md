## Overview

We have a maze, we can quit the game gracefully... but nothing very exciting is happening, right? So let's spice this thing up a bit and add some movement! 

In this step we are adding the player character and enabling its movement with the arrow keys.

`cd /work/pacgo`{{execute}}

## Task 01: Tracking player position

The first step in our journey is to create a variable to hold the player data. Since we will be tracking 2D coordinates (row and column), we will define a struct to hold that information:

```go
// Player is the player character \o/
type Player struct {
    row int
    col int
}

var player Player
```

We are also defining the player as a global variable, just for the sake of simplicity.

Next we need to capture the player position as soon as we load the maze, in the `loadMaze` function:

```
// traverse each character of the maze and create a new player when it locates a `P`
for row, line := range maze {
    for col, char := range line {
        switch char {
        case 'P':
            player = Player{row, col}
        }
    }
}
```

Note that this time we are using the full form of the `range` operator, as we are interested in which row and column we found the player.

Here is the complete `loadMaze` just for reference:

```go
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
            }
        }
    }

    return nil
}
```

### Optional: A note about visibility

We are keeping things simple here just for the sake of the tutorial. Since everything is a single file we are not taking into account the visibility of variables, ie, if they are public or private.

Nevertheless, Go has an interesting mechanic in regards to defining visibility. Instead of having a public keyword, it considers public every symbol whose name starts with a capital letter. On the other hand, if a name starts with a lowercase character, it is a private symbol.

That's why every library function name we've used so far begins with a capital letter. That's also why your IDE may complain if you don't place a comment above the `Player` struct definition. 

In this particular case, we are using capital letters just to differentiate the type `Player` from the variable `player`, since it doesn't make any sense to export a symbol from the package `main`.


<pre class="file" data-filename="/work/packgo/main.go" data-target="replace">
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
		fmt.Println(line)
	}
}

func readInput() (string, error) {
	buffer := make([]byte, 100)

	cnt, err := os.Stdin.Read(buffer)
	if err != nil {
		return "", err
	}

	if cnt == 1 && buffer[0] == 0x1b {
		return "ESC", nil
	}

	return "", nil
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

		// process collisions

		// check game over
		if input == "ESC" {
			break
		}

		// repeat
	}
}
</pre>
