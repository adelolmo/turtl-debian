# Turtl package for Debian and Ubuntu

Creates a Debian/Ubuntu package for Turtl. 
For more information about Turtl, please got to www.turtl.it

## How to install

```
  wget https://github.com/adelolmo/turtl-debian/releases/download/turtl-0.6.4/turtl_0.6.4_amd64.deb
  sudo dpkg -i turtl_0.6.4_amd64.deb
```

## How to build

1. Install "Effing Package Management"
  ```
  sudo gem install fpm
  ```
  This [wiki](https://github.com/jordansissel/fpm/wiki) provides all necessary information about EPM.

2. Run the shell script

  Download the script turtl_deb and run it localy.
  ```
    wget https://github.com/adelolmo/turtl-debian/blob/master/turtl_deb
    /bin/sh turtl_deb 64|32 [versiom]
  ```
  The first parameter is the system architecture, it must be 32 or 64. The second parameter is the version of Turtl, if it's not given it will use the latest version available in https://turtl.it
  The debian package will be created under /tmp/turtldeb
