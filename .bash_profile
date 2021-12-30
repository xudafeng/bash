## color
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=gxfxcxdxbxegedabagacad

## aliases
alias ls="ls -a -G"
alias ll="ls -l"
alias update="curl -o- https://raw.githubusercontent.com/xudafeng/bash/master/install.sh | bash && source ~/.bash_profile"
alias his="history | node ~/.bash/scripts/history.js"
alias archive="cd ~/prjs/archive"
alias clean="git branch | xargs git branch -D"
alias gitpull="git pull"

## visual code
VISUALSTUDIOCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

if [[ -f $VISUALSTUDIOCODE ]]; then
  alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code ."
fi

## git branch
get_git_branch() {
  echo $(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/') | node ~/.bash/scripts/color.js --color red 2>/dev/null
}

## node
get_node_version() {
  local node_version
  node_version=$(node -v 2>/dev/null)
  echo ${node_version:1} | node ~/.bash/scripts/color.js --color cyan 2>/dev/null
}

# nvm
export NVM_NODEJS_ORG_MIRROR="http://npm.taobao.org/dist"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PS
PS1="\u@node\$(get_node_version):\w\$(get_git_branch)\n➟ "
export PS1
export PKG_CONFIG_PATH="/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/"

## local bash profile
LOCAL_BASH_PROFILE="$HOME/.local_bash_profile"
if [[ -f $LOCAL_BASH_PROFILE ]]; then
  . $LOCAL_BASH_PROFILE
fi

## Android SDK
ANDROID_HOME=$HOME"/Library/Android/sdk"
if [ -d $ANDROID_HOME ]; then
  export ANDROID_HOME
  alias adb=$ANDROID_HOME"/platform-tools/adb"
  export ANDROID_SDK_ROOT=$ANDROID_HOME
fi

## PKG_CONFIG
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

## homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
eval "$(/opt/homebrew/bin/brew shellenv)"

## flutter
export PATH=$PATH:/usr/local/opt/flutter/bin

## autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

## direnv
eval "$(direnv hook bash)"