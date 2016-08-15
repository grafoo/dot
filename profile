# suse
grep -qs "SUSE" /etc/issue
if [ $? -eq 0 ]
then
  test -z "$PROFILEREAD" && source /etc/profile || true
fi

# editor
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# go
export GOROOT="$HOME/app/go"
export GOPATH="$HOME"

# java
test -d $HOME/app/jdk && export JAVA_HOME="$HOME/app/jdk"

# path
export PATH="$HOME/bin:$HOME/.local/bin:$GOROOT/bin:$JAVA_HOME/bin:$PATH"

# language
# see /usr/share/locale/locale.alias for options
export LANG=en_US.UTF-8
