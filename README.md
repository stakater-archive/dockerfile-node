# Dockerfile for Node JS 

### Supported tags and respective Dockerfile links
* 6.9, 6.9.5, latest ([6.9/Dockerfile](https://github.com/stakater/dockerfile-node/blob/master/6.9/Dockerfile))


## What is Node.js?

Node.js is a platform built on Chrome's JavaScript runtime for easily building
fast, scalable network applications. Node.js uses an event-driven, non-blocking
I/O model that makes it lightweight and efficient, perfect for data-intensive
real-time applications that run across distributed devices.

See: http://nodejs.org

## Usage

# How to use this image

## Create a `Dockerfile` in your Node.js app project

```dockerfile
FROM stakater/node:6.9
# replace this with your application's default port
EXPOSE 8888
```

You can then build and run the Docker image:

```console
$ docker build -t my-nodejs-app .
$ docker run -it --rm --name my-running-app my-nodejs-app
```

### Notes

The image assumes that your application has a file named
[`package.json`](https://docs.npmjs.com/files/package.json) listing its
dependencies and defining its [start
script](https://docs.npmjs.com/misc/scripts#default-values).

It also assumes that you have a file named [`.dockerignore`](https://docs.docker.com/engine/reference/builder/#/dockerignore-file) otherwise it will copy your local npm modules:

```
node_modules
```

We have assembled a [Best Practices Guide](./docs/BestPractices.md) for those using these images on a daily basis.

## Run a single Node.js script

For many simple, single file projects, you may find it inconvenient to write a
complete `Dockerfile`. In such cases, you can run a Node.js script by using the
Node.js Docker image directly, you will set the value of the `COMMAND` environment 
variable to the command you want to run :

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w
/usr/src/app -e COMMAND="node your-daemon-or-script.js" node:6.9 
```
Inspiration: https://hub.docker.com/_/node/