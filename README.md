# mySelfie
Let's take, share and rank selfies.
Made with Ruby on Rails, Vue JS and :heart:

## System dependencies
* yarn
* foreman

## Setup 
```
$ bin/setup
```

## Run
```
$ foreman start -f Procfile.dev -p 3000
```
`http://localhost:3000/tags`

## Setup with docker
```
$ docker-compose build
$ docker-compose run --rm website bin/setup
$ docker-compose up
```
`http://localhost:5000/tags`

 