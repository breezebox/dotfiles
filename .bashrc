# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

# User specific aliases and functions

## カスタマイズ設定
# プロンプトの設定
case ${UID} in
0)
    PS1='\[\033[31m\]${PWD}\$\[\033[0m\] '
    PS2='\[\033[31m\]>\[\033[0m\] '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[30m\]\h'" ${PS1}"
    ;;
*)
    PS1='\[\033[37m\]\w:\$\[\033[0m\] '
    PS2='\[\033[37m\]$\[\033[0m\] '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[36m\]\D{%F} \t \u@\h'" ${PS1}"
    ;;
esac

# ターミナルの表示設定
case "${TERM}" in
kterm*|xterm)
    PROMPT_COMMAND='echo -e "\033]0;'"${USER}@${HOSTNAME%%.*}:"'${PWD}\007\c"'
    ;;
esac

#  ヒストリ系の環境変数の設定
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
export HISTIGNORE=?:??:exit
export HISTFILE=~/.bash_history/.bash_history-$OSTYPE-`date +%Y%m%d`

# 標準エディタ環境変数の設定
EDITOR=vim

# ロケール環境変数の設定
LANG=ja_JP.UTF-8

# パスの設定
#PATH=$HOME/usr/bin:$PATH:~/bin
PATH=$HOME/usr/bin:$PATH:~/bin

#PERL_LWP_SSL_VERIFY_HOSTNAME=0
#PERL_NET_HTTPS_SSL_SOCKET_CLASS=Net::SSL

#HTTPS_CA_FILE=/etc/pki/tls/certs/ca-bundle.crt
#CURL_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

export PATH LANG EDITOR #PERL_LWP_SSL_VERIFY_HOSTNAME

# .inputrcの読み込み
[ -f ~/.inputrc ] && bind -f ~/.inputrc

# Alias
alias la='ls -a'
alias ll="ls -lrtkaF"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias vi='vim'

alias gdiff='git difftool'

