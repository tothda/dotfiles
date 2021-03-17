DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export HOMEBREW_BUNDLE_FILE="${DIR}/Brewfile"
brew bundle
