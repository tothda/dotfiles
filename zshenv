# make sure, that brew installed packages are used.
PATH="$HOME/.rbenv/bin:${PATH}"
PATH="/Applications/GitX.app//Contents/Resources:${PATH}"
PATH="/Users/tothda/libs/apache-ant-1.8.3/bin:${PATH}"
PATH="/Users/tothda/bin:${PATH}"
PATH=/usr/texbin:"$PATH"
PATH=~/src/dbx/cargo.scripts/scripts:"$PATH"
PATH=~/apps/glassfish4/bin:"$PATH"
PATH="/usr/local/bin:${PATH}"
export PATH

# Play path
export PLAY_PATH=/Users/tothda/libs/play-1.2.5rc4

eval "$(rbenv init -)"


# NVM
export NVM_DIR="/Users/tothda/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# JAVA HOME
export JAVA_HOME="`/usr/libexec/java_home -v 1.7`"

