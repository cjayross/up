# Up
> an easier way to navigate up directories

## Usage
There are three ways to invoke `up`: without arguments, with an integer
argument, with a name of a path beginning with a directory in the current
path.

### Without arguments
```bash
~/one/two
$ up
~/one
```

### With an integer argument
```bash
~/one/two/three
$ up 2
~/one
```

### With a path argument
```bash
~/one/left/two/three
$ up one/right
~/one/right
```

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
