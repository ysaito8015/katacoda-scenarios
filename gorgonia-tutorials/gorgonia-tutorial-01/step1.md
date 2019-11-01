## Emvironment

This scenario is running on ...

`Ubuntu 19.04`

`go 1.13.4`

## Instraction

`pwd; whoami; cat /etc/lsb-release`{{execute}}

When you click this <img src='https://i.gyazo.com/b1360ae66c0324fa407acb121d67ad48.png' width=15px>, `commands` are executed on the terminal on the right

## VS Code

You can use VS Code (code-server).

Click this tab <img src='https://i.gyazo.com/2490101f4dd25247eba6549c9698b5f3.png'>

## Getting gorgonia

Gorgonia is go-gettable and supports go modules. To get the library and its dependencies, simply run

`go get gorgonia.org/gorgonia`{{execute}}

It takes a while

## First script

make directory

`mkdir /work/gorgonia-getting-started && cd $_`{{execute}}

then create `main.go` as the code below

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

        fmt.Printf("%v", z.Value())
}
</pre>

then run script

`go run ./main.go`{{execute}}

We will get `4.5`
