## Task 04: Updating the Game Loop

Now it's time to update the game loop to have the `readInput` function called every iteration. Please note that on the advent of an error we need to break the loop as well.

```go
// process input
input, err := readInput()
if err != nil {
    log.Printf("Error reading input: %v", err)
    break
}
```

Finally, we can get rid of that permanent `break` statement and start testing for the "ESC" key press.

```go
if input == "ESC" {
    break
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
