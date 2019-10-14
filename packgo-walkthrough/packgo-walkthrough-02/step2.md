## Task 02: Restoring Cooked Mode

Restoring the cooked mode is a pretty straightfoward process. It is the same as enabling the cbreak mode, but with the flags reversed:

```go
func cleanup() {
    cookedTerm := exec.Command("/bin/stty", "-cbreak", "echo")
    cookedTerm.Stdin = os.Stdin

    err := cookedTerm.Run()
    if err != nil {
        log.Fatalf("Unable to activate cooked mode terminal: %v\n", err)
    }
}
```

Note that this `cleanup` function doesn't have a special meaning in Go like the `init` one, so we must explicitly call it in our `main` function. We can either call it at the end of the function or use the `defer` statement as shown below:

```go
func main() {
    // initialize game
    defer cleanup()

    // load resources
    // ...
```

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

		// process movement

		// process collisions

		// check game over

		// Temp: break infinite loop
		break

		// repeat
	}
}
</pre>
