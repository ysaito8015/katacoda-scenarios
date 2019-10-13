## Overview

In the last step we've learned how to print something to the standard output. Now it's time to learn how to read from standard input. 

In this game we will be processing a restricted set of movements: up, down, left and right. Besides those, the only other key we will be needing is the game end key, in order to enable the player to quit the game gracefully.

We will map the escape key (Esc) on the keyboard to do this graceful termination. The movements will be mapped to the arrow keys.

This step will handle the Esc key and we will see how to process the arrow keys in step 03.

But before getting into the implementation we need to know a bit about terminal modes.

## Intro to terminal modes

Terminals can run in three possible [modes](https://en.wikipedia.org/wiki/Terminal_mode): 

1. Cooked Mode
2. Cbreak Mode
3. Raw Mode

The cooked mode is the one that we are used to use. In this mode every input that the terminal receives is preprocessed, meaning that the system intercepts special characters to give them special meaning.

Note: Special characters include backspace, delete, Ctrl+D, Ctrl+C, arrow keys and so on...

The raw mode is the opposite: data is passed as is, without any kind of preprocessing.

The cbreak mode is the middle ground. Some characters are preprocessed and some are not. For instance, Ctrl+C still results in program abortion, but the arrow keys are passed to the program as is.

We will use the cbreak mode to allow us to handle the escape sequences corresponding to the escape and arrow keys.


## Task 01: Enabling Cbreak Mod

To enable the cbreak mode we are going to take advantage of an `init` function.

We said previously that the `main` function is the entrypoint of a given program. Besides that, we can also have an `init` function that perform initialization steps before the runtime calls the `main` function.

Additionally, we can have an `init` function for library packages to perform any necessary initialization. It's useful to note that you shouldn't count on the order of which the `init` functions are called in the scenario where you have multiple packages with multiple `init` functions.

Here is the definition of our `init`:

```go
func init() {
    cbTerm := exec.Command("/bin/stty", "cbreak", "-echo")
    cbTerm.Stdin = os.Stdin

    err := cbTerm.Run()
    if err != nil {
        log.Fatalf("Unable to activate cbreak mode terminal: %v\n", err)
    }
}
```

In the function above we are actually invoking another program that modifies the terminal configuration, called `stty`. We are both enabling the cbreak mode and disabling the cursor echo.

The `log.Fatalf` function will terminate the program after printing the log, in case of error. This is important here because without the cbreak mode the game is unplayable.`

<pre class="file" data-filename="/work/packgo/main.go" data-target="replace">
package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

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

func init() {
	cbTerm := exec.Command("/bin/stty", "cbreak", "-echo")
	cbTerm.Stdin = os.Stdin

	err := cbTerm.Run()
	if err != nil {
		log.Fatalf("Unable to activate cbreak mode terminal: %v\n", err)
	}
}

func main() {
	// initialize game

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

		// process movement

		// process collisions

		// check game over

		// repeat
	}
}
</pre>
