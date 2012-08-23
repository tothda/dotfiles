os=`uname -o`

if [[ "$os" == "Cygwin" ]]; then
    # http://stackoverflow.com/questions/3831131/rubygems-cygwin-posix-path-not-found-by-ruby-exe
    alias gem='gem.bat'
    alias rake='rake.bat'
    alias erb='erb.bat'
    alias irb='irb.bat'
    alias rdoc='rdoc.bat'
    alias ri='ri.bat'
    alias rspec='rspec.bat'
    alias cucumber='cucumber.bat'
    alias bundle='bundle.bat'
    alias play='play.bat'
fi
