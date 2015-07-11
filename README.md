# vim_dotfiles

To use these vim dotfiles you first need to clone the repository to a working folder on the system.

```
$ git clone https://github.com/jtdowney/vim_dotfiles ~/projects/vim_dotfiles
```

Next you need to symlink two places in your home folder.

```
$ ln -s ~/projects/vim_dotfiles/vimrc ~/.vimrc
$ ln -s ~/projects/vim_dotfiles/vim ~/.vim
```

The dotfiles use [Vundle](https://github.com/VundleVim/Vundle.vim) to manage plugins so that needs to be downloaded as well.

```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

To install the plugins start vim with:

```
$ vim +PluginInstall +qall
```

This first time it will prompt you to press enter because of a syntax error but you can safely continue.
