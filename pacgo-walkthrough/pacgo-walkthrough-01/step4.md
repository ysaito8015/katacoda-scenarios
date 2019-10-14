## Task 03: Updating the game loop

Now that we have both a `loadMaze` and a `printScreen` function, we should update the `main` function to initialize the maze and print it on the game loop. See the code below:

```go
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
```

Like always we are keeping the happy path to the left, so if the `loadMaze` function fails we log it and return to terminate the program execution. The `log.Println` function prints messages to the standard error in a structured log format.

Now that we've finished the game loop modifications we can run the program with `go run` or compile it with `go build` and run it as a standalone program.

You should see the maze printed to the terminal.

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

func printScreen() {
  for _, line := range maze {
    fmt.Println(line)
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
