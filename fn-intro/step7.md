## Task

Okay, since we are already familiar with the Fn routes, it time for some magic! Let's try to call our function!

To do that we need to get an HTTP webhook URL to our function:

`fn routes list katacoda`{{execute}}

Using the displayed URL let's try to call the function:

`curl -v docker:8080/r/katacoda/tutorial`{{execute}}

Boom! Your function just became a **serverless** function!

Let's try to call it one more time, this time using the Fn CLI:

`fn call katacoda tutorial`{{execute}}

As you can see the result is the same. The `fn call` encapsulates the HTTP API and some response data coercing.
Now let's try to call the functon with some data:

`curl -v docker:8080/r/katacoda/tutorial -d '{"name": "Denis"}'`{{execute}}

The same can be achieved with the Fn CLI:

`echo '{"name": "Denis"}' | fn call katacoda tutorial`{{execute}}
