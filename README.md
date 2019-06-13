## About

My Vim configuration

## Prerequisite

`+ruby` appears in `vim --version`

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
