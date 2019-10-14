## Overview

We have a maze, we can quit the game gracefully... but nothing very exciting is happening, right? So let's spice this thing up a bit and add some movement! 

In this step we are adding the player character and enabling its movement with the arrow keys.

`cd /work/packgo`{{execute}}

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
	"os/exec"
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

func printScreen() {
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

		// Temp: break infinite loop
		break

		// repeat
	}
}
</pre>
