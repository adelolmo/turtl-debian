# Turtl package for Debian and Ubuntu

Creates a Debian/Ubuntu package for Turtl. 
For more information about Turtl, please visit www.turtlapp.com

## How to install

```
  wget https://github.com/adelolmo/turtl-debian/releases/download/v0.7.2.6/turtl_0.7.2.6_amd64.deb
  sudo dpkg -i turtl_0.7.2.6_amd64.deb
```

## How to build

  Download the script ```package``` and run it locally.
  ```
    wget https://raw.githubusercontent.com/adelolmo/turtl-debian/master/turtl_deb
    /bin/sh package 64|32 [version]
  ```
  The first parameter is the system architecture, it must be 32 or 64. The second parameter is the version of Turtl, if it's not given it will use the latest version available in https://turtlapp.com
  The debian package will be created under build/releases.
  
## Oficial Turtl server URL

```
https://apiv3.turtlapp.com
```
