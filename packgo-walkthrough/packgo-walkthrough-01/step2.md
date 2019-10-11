## Overview

## Input and Output
In this lesson you will learn how to:

- Read from a file
- Print to the standard output
- Handle multiple return values
- Handle errors
- Create and add an element to a slice
- Iterate over a collection
- Defer a function call


We've got the basics covered, now it's time to get this game started!

First, we are going to read the maze data. We have a file called maze01.txt that's basically an ASCII representation of the maze (you can open it in a text editor if you like). You may assume that:

```
- # represents a wall
- . represents a dot
- P represents the player
- G represents the ghosts (enemies)
- X represents the power up pills
```

Our first task consists in loading this ASCII representation of the maze to a slice of strings and then printing it to the screen. Looks simple, right? It is indeed!

## Task 01: Load the Maze

Let's start by reading the `maze01.txt` file.

We are going to use the function `Open` from the `os` package to open it, and an scanner object from the buffered IO package (`bufio`) to read it to memory (to a global variable called `maze`). Finally we need to release the file handler by calling `os.Close`. 

All that comes together as the code below:

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

    return nil
}

var maze []string

```

