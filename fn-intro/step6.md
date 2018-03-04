## Task

In this task we would deploy our function to the Fn server.
To do so please use the following command:

`fn deploy --local --app katacoda`{{execute}}

`fn deploy` will use the application we created previously and with help of the `func.yaml` will create the Fn route to that function.

## What "route" is?

Route is an HTTP path to your function. So, basically, with help of the routes developers can define the HTTP webhook to the particular function.

Let's check the details of this function's route:

`fn routes i katacoda /tutorial`{{execute}}

Okay, you can see that route has more attributes than the `func.yaml`:
```json
{
        "format": "json",
        "idle_timeout": 30,
        "image": "katacode:0.0.2",
        "memory": 128,
        "path": "/tutorial",
        "timeout": 30,
        "type": "sync"
}
```

So, we have new attributes to us:
 - `idle_timeout` - in seconds, related to the function's format, defines the time that function should hang around in-between the calls before suspended
 - `memory` - in Mb, RAM allocated for the function
 - `timeout` - in seconds, function's call timeout, if function takes longer than the timeout it gets suspended
 - `type` - defines whether function is sync/async 
