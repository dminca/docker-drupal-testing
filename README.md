[![Build Status](https://travis-ci.org/dminca/dockerized-drupal.svg?branch=master)](https://travis-ci.org/dminca/dockerized-drupal)
# Drupal dev env based on Docker
> Run Drupal **8.1.1** from Docker containers

## Running the project

* First, Drupal must be pulled from the web and configured
```bash
make build-drupal
```
* Build the Docker image
```bash
make
```

* Spin up the containers
> During this stage, the PostgreSQL image will be pulled
```bash
make up
```
:boom: And that's it, you got yourself a fully-functional Drupal website on 
localhost without wasting time to install _Apache + PHP + Drupal_ on your machine.

## Credentials
The following credentials are used along the installation:
* **DB_USERNAME:** `drupal`
* **DB_PASSWORD:** `drupal`
* **DB_DATABASE:** `drupal`
* **DB_HOSTNAME:** `dockerizeddrupal_mysql_1` or `dockerizeddrupal_psql_1`

Choose the proper `DB_HOSTNAME` depending on which Database you use: MySQL or PostgreSQL.

#### Note for DB_HOSTNAME
In case there are problems with the host of the db, do `docker ps` and copy the NAME of
the DB Docker container

## Other commands
```bash
make down     # stop containers

make in       # enter the Drupal container

make restart  # restart containers

make clean    # remove containers and all local docker images
```

## Contributing
Feel free to fork and contribute to this code. :)

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Project references:
> Sources that guided me throughout the development of this project
* [PHP + Apache official docker image][1]
* [Docker compose official docs][2]
* [Dockerfile official docs][3]
* [Drupal system requirements - to be sure what to install][4]
* [Apache and PHP on Docker - good medium article used for inspiration][5]
* [Drupal installation step by step][6]
* [Mastering Git submodules - medium][8]
* [Drupal 7 with apache Dockerfile][9]
* [php 7.0 - apache Dockerfile][10]
* [OPCache problem solved][11]
* [Enabling Apache modules in Dockerfile][12]
* [Apache Dockerfile for inspiration][13]
* [Docker inspect template magic][14]
* [Official MySQL Docker image][15]
* [Alpine httpd Dockerfile by ncopa][16]

### License
Licensed under the great [GPLv3](http://choosealicense.com/licenses/gpl-3.0/)

Made with :heart: for [drupal][7] developers.


[1]: https://hub.docker.com/_/php/
[2]: https://docs.docker.com/compose/compose-file
[3]: https://docs.docker.com/engine/reference/builder
[4]: https://www.drupal.org/requirements
[5]: https://medium.com/dev-tricks/apache-and-php-on-docker-44faef716150#.l15osgxxs
[6]: https://www.drupal.org/documentation/install/download
[7]: https://www.drupal.org/
[8]: https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407#.p8ypfaftj
[9]: https://github.com/docker-library/drupal/blob/master/7/apache/Dockerfile
[10]: https://github.com/docker-library/php/blob/master/7.0/apache/Dockerfile
[11]: https://hub.docker.com/r/sinso/phpfpm-flow/~/dockerfile/
[12]: http://khornberg.github.io/articles/enabling-apache-modules-indockerfile-php/
[13]: https://github.com/voduytuan/docker-apache-php/blob/master/Dockerfile
[14]: http://container-solutions.com/docker-inspect-template-magic/
[15]: https://hub.docker.com/_/mysql/
[16]: https://github.com/ncopa/httpd/blob/d22ddf0c374fa749f683845342d258678895432a/2.4/alpine/Dockerfile
