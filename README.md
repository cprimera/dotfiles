Dotfiles
========

## Installation

### Automatic

The easiest way to install is using `install.sh` which can be done in a single step.

#### Using wget

```bash
wget https://raw.github.com/cprimera/dotfiles/master/install.sh -O - | sh
```

#### Using curl

```bash
curl https://raw.github.com/cprimera/dotfiles/master/install.sh | sh
```

### Manual

First clone the repository
```bash
git clone git://github.com/cprimera/dotfiles ~/dotfiles
```

You then have two choices:

##### Install Script

```bash
sh install.sh --local
```

This will clone the repository and all submodules and will create symlinks as necessary.

##### Manual

Load the other git submodules
```bash
git submodule init && git submodule update
```

Then create links for each file wanted
```bash
ln -s /path/to/src /path/to/dest
```
