# vim
## Setup
1. clone repo into '.vim'
    ```
    git clone https://github.com/mstyles/vim.git ~/.vim
    ```
1. simlink .vimrc to .vim/vimrc
    ```
    ln -s ~/.vim/vimrc ~/.vimrc
    ```
1. Enter vim directory
    ```
    cd ~/.vim
    ```
1. Install submodule
    ```
    git submodule update --init
    ```
1. Open vim
    ```
    vim
    ```
1. Install packages using dein
    ```
    :call dein#install()
    ```
1. rejoice
