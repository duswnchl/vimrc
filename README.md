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

4. Install [command-t](https://github.com/wincent/Command-T)
    ```
    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make
    ```

5. Make symbolic link for file type plugin

    `$ ./makesyms`

## Additional

* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* [Watchman](https://facebook.github.io/watchman/)
