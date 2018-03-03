## Task

In this task we would go through Fn apps API to get familiar with those.

## What “app” is?

In order to create a function Fn will ask a user to create a placeholder for that function, 
so we call it an “app”, so the idea here is very simple — “serverless app” consists of number of functions, 
it means that each function should relate to at least one app.

But an “app” is not just a placeholder or reference implementation of “serverless app” concept, 
it also can hold config that would be available in each function related to particular app. 
App’s config can be a storage for secrets, DB connection URI, i.e. something that needs to be available in each function.

## Working with Fn CLI

Let's see what we need to create our first application

`fn apps create -h`{{execute}}

Okay, as you can see at the bare minimum we need an application name, let's try to create an application with the name only:

`fn apps create katacoda`{{execute}}
