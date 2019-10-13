# laravel6.x-with-docker
a Laravel Image Based on official PHP images, use version 7.3, easy and useful.<br>

### Installation
thinkeramir/laravel6.x runs in a docker container, so just run the command down below and you're set.: <br>

    docker run -ti -p 8080:80 --name laravel6.x -d thinkeramir/laravel6.x
    
attach to the container look like this command:
```
docker exec -ti laravel6.x bash
```

you are logged into the container and now it is enough to run a command for creating a fresh Laravel app:

    laravel new blog

now we can access to own laravel app at:

[http://localhost:8080/blog/public/index.php](http://localhost:8080/blog/public/index.php)

##### if you need in docker-compose, you can use below code:
*docker-compose.yml*

```
version: '3'

services:

  web:
    container_name: laravel6.x
    image: thinkeramir/laravel6.x
    volumes:
      - ./blog:/var/www/html/blog
    ports:
      - 8080:80
    restart: always

```
and then
```
docker-compose up
```
