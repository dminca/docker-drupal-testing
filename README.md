# Dockerized infrastructure for Drupal
Easily start a Drupal website on localhost with Docker by issuing
```sh
$ docker-compose up
```
in the terminal

# Setting up the env
1. Pull the drupal archive and extract it in the `/drupal/` directory
```sh
$ curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz
$ tar -xz --strip-components=1 -f drupal.tar.gz
$ rm drupal.tar.gz
$ chown -R www-data:www-data sites
```
2. Create configuration file and grant permissions
```sh
$ cp sites/default/default.settings.php sites/default/settings.php
$ chmod a+w sites/default/settings.php
$ chmod a+w sites/default
```
3. (optional) Post installation permission check
> After the installation script has run, Drupal tries to set the permissions automatically to:

> 555 (read-execute) [dr-xr-xr-x] for the sites/default folder.
and
444 (read-only) [-r--r--r--] for the settings.php

> If not, you will need to manually set them:
```sh
$ chmod 555 sites/default
$ chmod 444 sites/default/settings.php
```

# License
Licensed under the famous [MIT License](http://opensource.org/licenses/MIT)
```

# License
Licensed under the famous [MIT License](http://opensource.org/licenses/MIT)
Copyright (c) Minca Daniel Andrei (http://completit.com)
