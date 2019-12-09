# Up
> an easier way to go up a directory

## Usage
[![asciicast](https://asciinema.org/a/ywaGKlMRHD2QySmL5CdisSwks.svg)](https://asciinema.org/a/ywaGKlMRHD2QySmL5CdisSwks)

There are three ways to invoke `up`:
+ without arguments, it is an alias for `cd ..`
+ by specifying an argument, you can go up that number of directories
    - for example, using `up 2` will go up two directories
+ by specifying a directory name, you can jump back to the specified directory
    - for example, if you are in `~/src/zsh/up`, then using `up src` brings you to `~/src`

## Installation
### Using [zplug](https://github.com/zplug/zplug)
Add to your `.zshrc`:
```bash
zplug "cjayross/up"
```
### Using [zgen](https://github.com/tarjoilija/zgen)
Add to your `.zshrc`:
```bash
zgen load cjayross/up
zgen save
```

### Using [Antigen](https://github.com/zsh-users/antigen)
Add to your `.zshrc`:
```bash
antigen bundle cjayross/up
antigen apply
```
