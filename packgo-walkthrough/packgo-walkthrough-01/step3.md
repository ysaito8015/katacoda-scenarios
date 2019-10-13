## Task 02: Printing to the Screen

Once we have the maze file loaded into memory we need to print it to the screen.

One way to do that is to iterate over each entry in the `maze` slice and print it. This can be conveniently done with the `range` operator:

```go

func printScreen() {
    for _, line := range maze {
        fmt.Println(line)
    }
}
```

Please note that we are using the `:=` assignment operator to initialize two values: the underscore (_) and the `line` variable. The underscore is just a placeholder for where the compiler would expect a variable name. Using the underscore means that we are ignoring that value.

In the case of the `range` operator, the first return value is the index of the element, starting from zero. The second return value is the value itself.

If we did not write the underscore character to ignore the first value, the range operator would return just the index (and not the value). For example:

```go
for idx := range maze {
    fmt.Println(idx)
}
```

Since in this case we only care about the content and not the index, we can safely ignore the index by assigning it to the underscore.

<pre class="file" data-filename="/work/packgo/main.go" data-target="replace">
package main

import (
	"bufio"
	"fmt"
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

func printScreen() {
	for _, line := range maze {
		fmt.Println(line)
	}
}

func main() {
	// initialize game

	// load resources

	// game loop
	for {
		// update screen

		// process input

		// process movement

		// process collisions

		// check game over

		// Temp: break infinite loop
		fmt.Println("Hello, Pac Go!")
		break

		// repeat
	}
}
</pre>
