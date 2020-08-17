# dotfiles-for-macos

> Read [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## Backup
```shell
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```


```shell
source ~/.zshrc
```

Add:
```shell
config status
config add .vimrc
config commit -m "Add vimrc"
config add .vim_runtime/my_config.vim -f
config commit -m "Add my vim config for amix/vimrc"
config push
```
Delete:
```shell
config rm ...
```
## Install your dotfiles onto a new system (or migrate to this setup) 
Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:
```shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```shell
echo ".cfg" >> .gitignore
```
Now clone your dotfiles into a [bare](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) repository in a "dot" folder of your `$HOME`:
```shell
git clone --bare https://github.com/keer2345/dotfiles-for-macos $HOME/.cfg
```
Define the alias in the current shell scope:
```shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Checkout the actual content from the bare repository to your `$HOME`:
```shell
config checkout
```
The step above might fail with a message like:
```shell
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your `$HOME` folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:
```shell
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
Re-run the check out if you had problems:
```shell
config checkout
```
Set the flag showUntrackedFiles to no on this specific (local) repository:
```shell
config config --local status.showUntrackedFiles no
```
You're done, from now on you can now type config commands to add and update your dotfiles:
```shell
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
