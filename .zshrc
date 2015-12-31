# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime rbenv)

source $ZSH/oh-my-zsh.sh

# make sure, that brew installed packages are used.
PATH="/usr/local/bin:${PATH}"
PATH="$HOME/.rbenv/bin:${PATH}"
eval "$(rbenv init -)"

PATH="/Applications/GitX.app//Contents/Resources:${PATH}"
PATH="/Users/tothda/libs/apache-ant-1.8.3/bin:${PATH}"
PATH="/Users/tothda/app/glassfish-3.1.2.2/bin:${PATH}"

PATH="/Users/tothda/bin:${PATH}"
PLAY_PATH=/Users/tothda/libs/play-1.2.5rc4

export PATH
export PLAY_PATH

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Emacs
EMACS_DIR='/Applications/Emacs.app/Contents/MacOS'
alias es="$EMACS_DIR/Emacs --daemon"
alias emacs="$EMACS_DIR/bin/emacsclient -c -n"
export EDITOR=vim

# GIT aliases
alias gs='git status'

# Emacs
alias demacs="rm ~/.emacs.d && ln -s ~/.emacs.hiperk.d ~/.emacs.d && $EMACS_DIR/Emacs &"
alias memacs="rm ~/.emacs.d && ln -s ~/.emacs.magnars.d ~/.emacs.d && $EMACS_DIR/Emacs &"
alias spacemacs="rm ~/.emacs.d && ln -s ~/.emacs.spacemacs.d ~/.emacs.d && $EMACS_DIR/Emacs &"
# NVM
export NVM_DIR="/Users/tothda/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# JAVA HOME
export JAVA_HOME="`/usr/libexec/java_home -v 1.7`"

# BasicTex
export PATH=/usr/texbin:"$PATH"

# Play path
export PLAY_PATH=/Users/tothda/libs/play-1.2.5rc4
