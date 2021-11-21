## Emvironment

This scenario is running on ...

`Ubuntu 20.04`

`go 1.17.3`

## Instraction

After installing the Go files, you can execute commands at the terminal on the right.

for example,

`pwd; whoami; cat /etc/lsb-release; go version`{{execute}}

When you click this mark at the end of `code line` &#x23CE;, `commands` are executed on the terminal.

## VS Code

You can use VS Code (code-server).

Click this tab <img src='https://i.gyazo.com/2490101f4dd25247eba6549c9698b5f3.png'>

If you can only blank page after clicking VS Code tab, click the circle icon after a while.

<img src='https://i.gyazo.com/71374e12cc61c8316fed21ae5ceae103.png'>

## Before starting

make a directory and `cd` to it.

`mkdir /work/gorgonia-getting-started && cd $_`{{execute}}

then make a `go.mod` file.

`go mod init gorgonia`{{execute}}

## Getting gorgonia

Gorgonia is go-gettable and supports go modules. To get the library and its dependencies, simply run.

`go get gorgonia.org/gorgonia`{{execute}}

It takes a while.

## First script

`main.go` as the code below.

<pre class="file" data-target="clipboard">
package main

import (
        "fmt"
        "log"

        "gorgonia.org/gorgonia"
)

func main() {
        g := gorgonia.NewGraph()

        var x, y, z *gorgonia.Node
        var err error

        // define the expression
        x = gorgonia.NewScalar(g, gorgonia.Float64, gorgonia.WithName("x"))
        y = gorgonia.NewScalar(g, gorgonia.Float64, gorgonia.WithName("y"))
        if z, err = gorgonia.Add(x, y); err != nil {
                log.Fatal(err)
        }

        // create a VM to run the program on
        machine := gorgonia.NewTapeMachine(g)
        defer machine.Close()

        // set initial values then run
        gorgonia.Let(x, 2.0)
        gorgonia.Let(y, 2.5)
        if err = machine.RunAll(); err != nil {
                log.Fatal(err)
        }

        fmt.Printf("%v\n", z.Value())
}
</pre>

## Run the code

First, you have to run below,

`go mod tidy`{{execute}}

then run script.

`go run ./main.go`{{execute}}

We will get `4.5`.
