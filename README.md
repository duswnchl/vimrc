## About

My Vim configuration

## Prerequisite

`+ruby +lua` should appears in `vim --version`

1. If You have trouble with lua,
```
sudo ln -s /usr/include/lua5.3 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/local/lib/liblua.so
```
1. Configure and build vim.
```
./configure --with-features=huge                    \
            --enable-multibyte                      \
            --enable-rubyinterp=yes                 \
            --enable-python3interp=yes              \
            --enable-pythoninterp=yes               \
            --enable-luainterp=yes                  \
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
* [Watchman](https://facebook.github.io/watchman/)
