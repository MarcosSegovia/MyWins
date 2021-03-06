[![Build Status](https://travis-ci.org/marcossegovia/MyWins.svg?branch=master)](https://travis-ci.org/marcossegovia/MyWins)
[![Go Report Card](https://goreportcard.com/badge/github.com/marcossegovia/MyWins)](https://goreportcard.com/report/github.com/marcossegovia/MyWins)
[![GitHub release](https://img.shields.io/badge/release-v0.2-blue.svg)](https://github.com/marcossegovia/MyWins/releases/tag/v0.2)

<p align="center">
	<img alt="MyWins" src="logo.png?raw=true">
</p>

MyWins is a service to track your daily routines whatever it is, just to cheer you up in the pursuit of your dreams.

##How it works

1. You should download the app form `url` and create an account. (To be done)
2. After you've already log in, you'll be asked to submit your success or your fail of the day.
3. Keep your wins green!

##Installation

1. You just `go get github.com/marcossegovia/MyWins` so you'll get the repository inside your go workspace.
2. Be sure to get [glide](https://github.com/Masterminds/glide) to be able to get dependencies. 
3. If so, then run `glide install`


##How to build and run it locally

1. First you'll have to provide a mongodb running in your local machine. The fastest way is to provide a mongodb container with Docker by typing `docker run -P -d mongo`
2. We set the mongoDBPort (we can check in which port Docker is providing Mongo service by typing `docker ps`) in the config file `MyWins/config/mongo_dev.yml` like `"mongoDBPort": "32770",`
3. We build our project to generate the binary `go build -o bin/mywins src/*.go`
4. We run the binary `./bin/mywins`
3. MyWins will be running on 0.0.0.0:8080 and 0.0.0.0:8081

##How to build and run it with Docker locally

1. Build it with the Dockerfile provided `docker build -t marcossegovia/mywins .`
2. Run the docker-compose file like the following `docker-compose up -d mywins`
3. Run a `docker ps` and you'll see the app running on the 0.0.0.0:8080 and 0.0.0.0:8081 and automatically connected to a mongodb container internally with unneeded manual configuration.

##Usage

MyWins is based in the [OAuth 2.0](https://oauth.net/2/) protocol to establish communication with the api provided.

By default I've provided a default client to be able to access the different endpoints in the API.
To be able to authenticate with MyWins as the default client you have two alternatives:

1. Making a GET request to the endpoint `http://localhost:8081/login` and submit the form with your client credentials (`client_id: 1234` `client_secret: abcd`)
2. Making a POST Request to the endpoint `http://localhost:8081/login` with the form parameters in the request body.
    > Example CURL request
    ```
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -H "Cache-Control: no-cache" -d 'grant_type=client_credentials&client_id=1234&client_secret=abcd' "http://localhost:8081/login"
    ```

From now on you'll have access to all the endpoints of the MyWins API by using the provided token:

![Token Response Example](/token_example.png)

Just by adding the Authorization header with the Bearer Token.

Example CURL request to the endpoint `/wins` using the token of the example:
`curl -X GET -H "Authorization: Bearer Y_Viqe4xQBW0l-chNPiZqw" -H "Cache-Control: no-cache" "http://localhost:8080/wins"`

##Roadmap

When reaching stability to release the v1.0, MyWins is going to push forward and provide friendly frontend clients to consume from different devices.

iOS app is going to take place to be able to directly get track of your current MyWins streaks !
