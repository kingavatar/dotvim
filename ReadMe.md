# DotVim
My Vim Configuration Files with plugins.

### When Installing a new Plugin
```
  cd ~/.vim
  mkdir -p ~/.vim/bundle
  git submodule add http://github.com/username/plugin_repo.git bundle/<plugin>
  git add .
  git commit -m "Install <plugin> bundle as a submodule."
```

### For Installing in New Environments:
```
  cd ~
  git clone http://github.com/kingavatar/dotvim.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  cd ~/.vim
  git submodule update --init
```

### For Upgrading all Plugins:
```
  cd ~/.vim
  git submodule foreach git pull origin master
```
### For Removing a Plugin:
```
  cd ~/.vim
  rm -rf plugged/submodule
  git submodule deinit -f -- plugged/submodule
  rm -rf .git/modules/plugged/submodule
 ```
 Then
 ```
  git rm -f plugged/submodule
 ```
Note: plugged/submodule (no trailing slash)
or, if you want to leave it in your working tree and have deleted the plugin
```
  git rm --cached plugged/submodule
```
