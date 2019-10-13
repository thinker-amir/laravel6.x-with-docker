# laravel6.x-with-docker
a Laravel Image Based on official PHP images, use version 7.3, easy and useful.<br>
the command to run this image: <br>

    docker run -ti thinkeramir/laravel6.x bash
you are logged into the container and now it is enough to run a command for creating a fresh Laravel app:

    laravel new blog

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
