## color
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
alias gitpull="git pull"
alias gitpush="git push"
alias qmake="~/prjs/Qt/5.3/clang_64/bin/qmake"
alias godoc="echo ➟ godoc is running … && open http://localhost:6060/doc/ && godoc -http=:6060"
alias update="curl -o- https://raw.githubusercontent.com/xudafeng/bash/master/install.sh | bash && source ~/.bash_profile"
alias archive="cd ~/prjs/archive"
alias book="cd ~/prjs/525"
## mvn
#MVNBIN="/opt/apache-maven-3.0.5/bin/mvn"
#if [ -f $MVNBIN ]; then
#  alias mvn=$MVNBIN
#fi
## gcc
alias gcc="/usr/bin/gcc"
## sublime
SUBLIMEBIN="/Applications/Sublime.app/Contents/SharedSupport/bin/subl"
if [ -f $SUBLIMEBIN ]; then
  alias sublime=${SUBLIMEBIN}" ."
fi
## visual code
VISUALSTUDIOCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

if [[ -f $VISUALSTUDIOCODE ]]; then
  alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code ."
fi

# git branch
get_git_branch() {
  echo $(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/') | node ~/.bash/scripts/color.js --color red 2>/dev/null
}
# node
get_node_version() {
  local node_version
  node_version=$(node -v 2>/dev/null)
  echo ${node_version:1} | node ~/.bash/scripts/color.js --color cyan 2>/dev/null
}
# nvm
export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/dist"
export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

PS1="\u@node\$(get_node_version):\w\$(get_git_branch)\n➟ "
export PS1
export PKG_CONFIG_PATH="/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/"

## Android SDK
ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"
if [ -d $ANDROID_HOME ]; then
  export ANDROID_HOME
  alias adb=$ANDROID_HOME"/platform-tools/adb"
fi
## JAVA HOME
JAVA_HOME=`/usr/libexec/java_home -v '1.8*'`
if [ -d $JAVA_HOME ]; then
  export JAVA_HOME
fi
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export HADOOP_HOME=/opt/hadoop-2.7.3

export HADOOP_PREFIX=/opt/hadoop-2.7.3

export PATH=$PATH:$HADOOP_HOME/bin
