## Task

In this task we will create out first serverless function written with Golang.
We need to create a folder for the function's code:

`mkdir intro && cd intro`{{execute}}

To simplify the process of creating functions Fn CLI tool allows to generate 
the boilerplate (very specific to every programming language, know as the `runtime`)

`fn init --runtime go`{{execute}}

In editor you can see new files generated:
 - func.yaml
 - func.go
 - Gopkg.toml
 - test.json

So, what are these files?

## func.yaml

Functions files are used to assist fn to help you when creating functions.

```yaml
name: intro
version: 0.0.1
runtime: go
entrypoint: ./func
format: json
```

`name` represents the name and tag to which this function will be pushed to and the route updated to use it.
`version` represents current version of the function. When deploying, it is appended to the image as a tag.
`runtime` represents programming language runtime, for example, 'go', 'python', 'java', etc. The runtime 'docker' will use the existing Dockerfile if one exists.
`entrypoint` represents an entrypoint to your function's main function.
`format` represents one of the streaming formats covered at [Fn developer docs: function formats](https://github.com/fnproject/fn/blob/master/docs/developers/function-format.md).

For more information regarding function files you can refer to [Fn developer docs: function file](https://github.com/fnproject/fn/blob/master/docs/developers/function-file.md).

## func.go

This is your implementation of the serverless function. Let's go through it.
```go
package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io"

	fdk "github.com/fnproject/fdk-go"
)

func main() {
	fdk.Handle(fdk.HandlerFunc(myHandler))
}

type Person struct {
	Name string `json:"name"`
}

func myHandler(ctx context.Context, in io.Reader, out io.Writer) {
	p := &Person{Name: "World"}
	json.NewDecoder(in).Decode(p)
	msg := struct {
		Msg string `json:"message"`
	}{
		Msg: fmt.Sprintf("Hello %s", p.Name),
	}
	json.NewEncoder(out).Encode(&msg)
}
```

This generated code does the following:
 - reads the incoming request
 - tries to unmarshal request's data
 - creates a response body based on unmarshaled `Person` name 
 - decodes the response data

## What is an FDK?

The Fn Project allows developers to choose the intercommunication protocol format between an application and serverless function.
So, what is an FDK and why do we need it? No matter what kind of format is defined for a particular function, Fn will serve the requests 
through STDIN and wait on STDOUT for the response and STDERR for function logs. In order to simplify function development, 
the Fn team provides language-specific libraries or Function Development Kits (FDK) for languages like Java, Python, Node, and Go.
The main goal of an FDK is to let developers focus on their functions and hide all routine complexities underneath.

In this particular case, [fdk-go](https://github.com/fnproject/fdk-go) hides all Fn-specific format-related routine and let developers focus on development.

## Gopkg.toml

It's the [go dep tool](https://github.com/golang/dep) dependency management tool files where you can put all your dependencies that your function needs.

## test.json

It's a test file that is used to test your function, it defines an input and the output of the function, helps to identify if the function works correctly or not.
More on function testing we would cover later.
