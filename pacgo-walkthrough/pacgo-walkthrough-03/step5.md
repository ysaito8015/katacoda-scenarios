## Task 05: Clearing the Screen

Since we now have a proper game loop, we need to clear the screen after each loop so we have a blank screen for drawing in the next iteration. In order to do that, we are going to use some special escape sequences.

```go
func clearScreen() {
    fmt.Printf("\x1b[2J")
    moveCursor(0, 0)
}

func moveCursor(row, col int) {
    fmt.Printf("\x1b[%d;%df", row+1, col+1)
}
```

[Escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code#Escape_sequences) are called like that because they start with the ESC character (0x1b) followed by one or more characters. Those characters work as commands for the terminal emulator.

We are using above two commands: one for clearing the screen and other for moving the cursor to a given position.

We will update the printScreen function to call clearScreen before printing, so we are sure to be using a blank screen each frame:

```go
func printScreen() {
    clearScreen()
    for _, line := range maze {
        fmt.Println(line)
    }
}
```

Now run the game again and try hiting the `ESC` key.

Please note that if you hit Ctrl+C by any chance the program will terminate without calling the cleanup function, so you won't be able to see what you are typing in the terminal (because of the `-echo` flag).

If you get into that situation either close the terminal and reopen it or just run the game again and exit gracefully using the `ESC` key.

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
