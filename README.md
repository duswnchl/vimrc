## About

My Vim configuration

## Prerequisite

`+ruby +lua` should appears in `vim --version`

1. You have to fix lua path with Ubuntu 18.04.

```
sudo ln -s /usr/include/lua5.3 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/local/lib/liblua.so
```

2. Configure and build vim.
```
./configure --prefix=/home/duswnchl/Package/vim/out \
            --with-features=huge                    \
            --enable-multibyte                      \
            --enable-rubyinterp=yes                 \
            --enable-python3interp=yes              \
            --enable-pythoninterp=yes               \
            --enable-cscope                         \
            --srcdir=.                              \
            --enable-luainterp=yes                  \
            --cache-file=auto/config.cache          \
```

## Installation

1. Set up vimrc with symbolic link:
    ```
        $ git clone https://github.com/duswnchl/vimrc.git ~/Package
        $ ln -s $HOME/Package/vimrc/vimrc ~/.vimrc
    ```

2. Set up [Vundle](https://github.com/gmarik/Vundle.vim)

3. Install plugin with Vundle

    Launch `vim` and run `:PluginInstall`

4. Branch 'vim-gutter' to 'nvim'

5. Install [command-t](https://github.com/wincent/Command-T)

6. Make symbolic link for file type plugin

    `$ ./makesyms`

## TODO

* Add [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

## Additional

* [vimawesome](https://vimawesome.com/)
* [Watchman](https://facebook.github.io/watchman/)
