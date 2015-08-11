# color
red_start="\[\e[31m\033[1m\]"
cyan_start="\[\e[36m\033[1m\]"
color_end="\[\e[0m\]"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export ACK_COLOR_MATCH='green bold'
export ACK_COLOR_FILENAME='magenta underline bold'
export PATH="~/prjs/Qt/5.3/clang_64/bin":$PATH
# aliases
alias ..="cd .."
alias ls="ls -a -G"
alias ll="ls -l"
alias please="sudo"
alias pull="git pull"
alias push="git push"
alias qmake="~/prjs/Qt/5.3/clang_64/bin/qmake"
alias godoc="echo ➟ godoc is running … && open http://localhost:6060/doc/ && godoc -http=:6060"
alias adoc="cd /opt/android-sdk-macosx/docs && startserver"
alias update="wget -O - https://raw.githubusercontent.com/xudafeng/bash/master/install.sh | sh && source ~/.bash_profile"
alias todo="cd ~/prjs/todo && startserver -m"
alias mvn="/opt/apache-maven-3.2.3/bin/mvn"
alias gcc="/usr/bin/gcc"
alias adb="/opt/android-sdks/platform-tools/adb"
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."
# git branch
get_git_branch() {
  echo $(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
}
# node verison
get_node_version() {
  local node_version
  node_version=$(node -v 2>/dev/null)
  echo ${node_version:1}
}
PS1="\u@node$cyan_start\$(get_node_version)$color_end:\w$red_start\$(get_git_branch)$color_end\n$red_start""➟ ""$color_end"
export PS1
export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/dist"
export PKG_CONFIG_PATH="/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/"
export NVM_DIR=$HOME"/.nvm"

ANDROID_HOME="/opt/android-sdks"
export ANDROID_HOME
JAVA_HOME=`/usr/libexec/java_home`
export JAVA_HOME

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use system

##
# Your previous /Users/xdf/.bash_profile file was backed up as /Users/xdf/.bash_profile.macports-saved_2015-08-06_at_16:19:20
##

# MacPorts Installer addition on 2015-08-06_at_16:19:20: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

