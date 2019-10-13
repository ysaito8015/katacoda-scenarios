## Emvironment

These scenarios are running on ...

`Ubuntu 19.04`

`go 1.13.1`

## Instraction

`pwd; whoami; cat /etc/lsb-release`{{execute}}

When you click this <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px>, `commands` are executed on the terminal on the lower half of right

## Katacoda Editor

There is an editor on the uppder half of right.

You can check directory tree and open files.

![](https://i.gyazo.com/6110e1d09bf91b2f61335108afeec99b.png)

When you click <img src='https://i.gyazo.com/36732319491cd2b4ebeeb1a9ef0e0356.png' width=120px>, you can copy code to editor.

It has automaticary saving.

Let's take a look

`mkdir -p /work/packgo && cd $_ && touch ./main.go`{{execute}}

and then click to open this file.

file name: `main.go`

You can copy codes below to `main.go`

<pre class="file" data-filename="/work/packgo/main.go" data-target="replace">
package main

import "fmt"

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

## Running your first Go program

Now that we have a `main.go` file (`.go` is the file extension for Go source code), you can run it by using the command line tool `go`. Just type:

` go run main.go`{{execute}}

That's how we run a single file in Go. You can also build it as an executable program with the command `go build`. If you run `go build` it will compile the files in the current directory in a binary with the name of the directory. Then you can run it as a regular program, for example:

` go build`{{execute}}

## Understanding the program

Now let's have a close look of what the program does.

First line is the `package` name. Every valid Go program must have one of these. Also, if you want to make a **runnable** program you must have a package called `main` and a `main` function, which will be the entry point of the program.

We are creating an executable program so we are using `package main` on the top of the file.

Next are the `import` statements. You use those to make code in other packages accessible to your program.

Finally the `main` function. You define function in Go with the keyword `func` followed by it's name, it's parameters in between a pair of parenthesis, followed by the return value and finally the function body, which is contained in a pair of curly brackets `{}`. For example:

```go
func main() {
    // I'm a function body
}
```

This is a function called `main` which takes no parameters and return nothing. That's the proper definition of a main function in Go, as opposed to the definitions in other languages where the main function may take the command line arguments and/or return an integer value.

We have different ways to deal with the command line arguments and return values in Go, which we will see in Step 10.

In the game main function we have some comments (any text after `//` is a comment) that are acting as placeholders for the actual game code. We will use those to drive each modification in a orderly way.

The most important concept in a game is what is called the game loop. That's basically an infinite loop where all the game mechanics are processed.

A loop in Go is defined with the keyword `for`. The `for` loop can have an initializer, a condition and a post processing step, but all of those are optional. If you omit all you have a loop that never ends:

```go
for {
    // I never end
}
```

We can exit an infinite loop with a `break` statement. We are using it in the sample code to end the infinite loop after printing "Hello, Pac Go!" with the `Println` function from the `fmt` package (comments omitted for brevity):

```go
func main() {
    for {
        fmt.Println("Hello, Pac Go!")
        break
    }
}
```

Of course, in this case the infinite loop with a non-conditional break is pointless, but it will make sense in the next steps!

Congratulations, step 00 is complete! 
