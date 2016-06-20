[![Build Status](https://travis-ci.org/dminca/drupal-docker.svg?branch=master)](https://travis-ci.org/dminca/drupal-docker) [![Join the chat at https://gitter.im/dminca/dockerized-drupal](https://badges.gitter.im/dminca/dockerized-drupal.svg)](https://gitter.im/dminca/dockerized-drupal) [![Join the chat on IRC #drupal-contribute](https://img.shields.io/badge/chat-on%20IRC-89c4ff.svg)](https://www.drupal.org/irc) [![Join the chat on Telegram Messenger](https://img.shields.io/badge/chat-Telegram-1E95D3.svg)](https://telegram.me/dminca)
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
> Sources that guided me throughout the development of this project can be found in the [wiki section][1] of the project.

### License
Licensed under the great [GPLv3](http://choosealicense.com/licenses/gpl-3.0/)

Made with :heart: for [drupal][2] developers.


[1]: https://github.com/dminca/dockerized-drupal/wiki/References
[2]: https://www.drupal.org/