# DotVim
My Vim Configuration Files with plugins.

### When Installing a new Plugin
  cd ~/.vim
  mkdir -p ~/.vim/bundle
  git submodule add http://github.com/username/plugin_repo.git bundle/<plugin>
  git add .
  git commit -m "Install <plugin> bundle as a submodule."


### For Installing in New Environments:
  cd ~
  git clone http://github.com/kingavatar/dotvim.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  cd ~/.vim
  git submodule update --init


### For Upgrading all Plugins:

  git submodule foreach git pull origin master
