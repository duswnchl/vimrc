## About

My Vim configuration

## Prerequisite

`+ruby +python3` should appears in `vim --version`

Please configure and build vim before install vimrc.
```
./configure --with-features=huge                    \
            --enable-multibyte                      \
            --enable-rubyinterp                     \
            --enable-python3interp                  \
            --enable-cscope                         \
            --srcdir=.                              \
```

## Installation

1. Set up vimrc with symbolic link:
    ```
        $ git clone https://github.com/duswnchl/vimrc.git ~/Packages
        $ ln -s $HOME/Packages/vimrc/vimrc ~/.vimrc
    ```
1. Set up [Vundle](https://github.com/gmarik/Vundle.vim)
1. Install plugin with Vundle: `:PluginInstall`
1. Install [command-t](https://github.com/wincent/Command-T)

## TODO

## Additional

* [vimawesome](https://vimawesome.com/)
