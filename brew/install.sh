DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export HOMEBREW_BUNDLE_FILE="${DIR}/Brewfile"
export HOMEBREW_BUNDLE_NO_LOCK=1
brew bundle
