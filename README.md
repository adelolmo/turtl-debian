# Turtl package for Debian and Ubuntu

Creates a Debian/Ubuntu package for Turtl. 
For more information about Turtl, please visit www.turtlapp.com

## How to install

Download the package from https://github.com/adelolmo/turtl-debian/releases and install it:

    sudo dpkg -i turtl_0.7.2.6_amd64.deb

## How to build

    make

Parameters available are `VERSION` and `ARCH`. e.g:

    make VERSION=0.7.2.6-pre-sync-fix ARCH=i386

Turtle comes precompiled for `amd64` and `i386` architectures. 
For the available versions, please visit https://turtlapp.com 
  
## Oficial Turtl server URL

```
https://apiv3.turtlapp.com
```
