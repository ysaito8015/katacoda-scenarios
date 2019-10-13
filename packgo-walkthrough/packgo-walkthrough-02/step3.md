## Task 03: Reading from Stdin

The process of reading from the standard input involves calling the function `os.Stdin.Read` with a given read buffer.

The `os.Stdin.Read` returns two values: the number of bytes read and an error value. Have a look at the code for the `readInput` function below:

```go
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
```

The `make` function is a [built-in function](https://golang.org/pkg/builtin/#make) that allocates and initializes objects. It is only used for slices, maps and channels. In this case we are creating an array of bytes with size 100 and returning a slice that pointers to it.

After the usual error handling (we are just passing the error up on the call stack), we are testing if we read just one byte and if that byte is the escape key. (0x1b is the hexadecimal code that represents Esc).

We return "ESC" if the Esc key was pressed or an empty string otherwise.

Now you may wonder why allocating a buffer of 100 bytes, or why testing the count of exact one byte... 

What if the buffer suddenly has 5 elements and one of them is the Esc key? Shouldn't we care to process that? Will that key press be lost?

The short answer is we shouldn't care. Please keep in mind that this is a game. Depending on the processing speed and the length of your keyboard buffer, if we processed events sequentially we could introduce movement lag, ie, by having a queue of arrow key presses that were not processed yet.

Since we are reading the input on a loop, there is no damage in dropping all the key presses in a queue and just focusing on the last one. That will make the game response work better than if we were concerned about every key press.

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

		// repeat
	}
}
</pre>
