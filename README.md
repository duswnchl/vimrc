## About

My Vim configuration

## Prerequisite

`+python3` should appears in `vim --version`.
- python3: YouCompleteMe

Please configure and build vim before install vimrc.
```
./configure --enable-python3interp                  \
            --srcdir=.                              \
```

## Installation

1. Set up vimrc with symbolic link:
    ```
        $ git clone https://github.com/duswnchl/vimrc.git ~/Packages
        $ ln -s $HOME/Packages/vimrc/vimrc ~/.vimrc
    ```
1. Set up [Vundle](https://github.com/gmarik/Vundle.vim)
1. Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
1. Install [command-t](https://github.com/wincent/Command-T)

## Additional

* [vimawesome](https://vimawesome.com/)
