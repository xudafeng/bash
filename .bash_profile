## color
red_start="\[\e[31m\033[1m\]"
cyan_start="\[\e[36m\033[1m\]"
color_end="\[\e[0m\]"
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=gxfxcxdxbxegedabagacad
## QT
QTBIN="/opt/Qt/5.3/clang_64/bin"
if [ -d $QTBIN ]; then
  export PATH=$QTBIN:$PATH
fi
## aliases
alias ls="ls -a -G"
alias ll="ls -l"
alias please="sudo"
alias gitpull="git pull"
alias gitpush="git push"
alias qmake="~/prjs/Qt/5.3/clang_64/bin/qmake"
alias godoc="echo ➟ godoc is running … && open http://localhost:6060/doc/ && godoc -http=:6060"
alias update="curl -o- https://raw.githubusercontent.com/xudafeng/bash/master/install.sh | bash && source ~/.bash_profile"
alias todo="cd ~/prjs/todo && startserver -m"
## mvn
MVNBIN="/opt/apache-maven-3.2.3/bin/mvn"
if [ -f $MVNBIN ]; then
  alias mvn=$MVNBIN
fi
## gcc
alias gcc="/usr/bin/gcc"
## sublime
SUBLIMEBIN="/Applications/Sublime.app/Contents/SharedSupport/bin/subl"
if [ -f $SUBLIMEBIN ]; then
  alias sublime=${SUBLIMEBIN}" ."
fi
# git branch
get_git_branch() {
  echo $(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
}
# node
get_node_version() {
  local node_version
  node_version=$(node -v 2>/dev/null)
  echo ${node_version:1}
}
export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/dist"
export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

PS1="\u@node$cyan_start\$(get_node_version)$color_end:\w$red_start\$(get_git_branch)$color_end\n$red_start""➟ ""$color_end"
export PS1
export PKG_CONFIG_PATH="/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/"

## Android SDK
ANDROID_HOME="/opt/android-sdks"
if [ -d $ANDROID_HOME ]; then
  export ANDROID_HOME
  alias adb=$ANDROID_HOME"/platform-tools/adb"
fi
## JAVA HOME
JAVA_HOME=`/usr/libexec/java_home`
if [ -d $JAVA_HOME ]; then
  export JAVA_HOME
fi
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

## Docker
VM=default
DOCKER_MACHINE=/usr/local/bin/docker-machine
VBOXMANAGE=/Applications/VirtualBox.app/Contents/MacOS/VBoxManage

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

unset DYLD_LIBRARY_PATH
unset LD_LIBRARY_PATH

if [ ! -f $DOCKER_MACHINE ] || [ ! -f $VBOXMANAGE ]; then
  echo "Either VirtualBox or Docker Machine are not installed. Please re-run the Toolbox Installer and try again."
  exit 1
fi

$VBOXMANAGE showvminfo $VM &> /dev/null
VM_EXISTS_CODE=$?

if [ $VM_EXISTS_CODE -eq 1 ]; then
  $DOCKER_MACHINE rm -f $VM &> /dev/null
  rm -rf ~/.docker/machine/machines/$VM
  $DOCKER_MACHINE create -d virtualbox --virtualbox-memory 2048 --virtualbox-disk-size 204800 $VM
fi

VM_STATUS=$($DOCKER_MACHINE status $VM 2>&1)
if [ "$VM_STATUS" != "Running" ]; then
  $DOCKER_MACHINE start $VM
  yes | $DOCKER_MACHINE regenerate-certs $VM
fi

eval $($DOCKER_MACHINE env --shell=bash $VM)
echo -e "Hi $LOGNAME, docker is ready to use the ${GREEN}$VM${NC} machine with IP ${GREEN}$($DOCKER_MACHINE ip $VM)${NC}."
