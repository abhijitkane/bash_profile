export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#-----for colored terminal--------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PATH=$PATH:~/code/Play20
export PATH="$PATH:/usr/local/mysql/bin"


#---------basic aliases--------
alias ls='ls -GFp'
alias ..='cd ..'
alias ...='cd ../..'
alias cpwd='pwd|tr -d "\n"|pbcopy'

alias gl='git log --pretty=format:"%Cred%h%Creset . %an: %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'

alias pserv='python -m SimpleHTTPServer 8000'

#---------Shell functions-----

rvpn() {
    sudo launchctl stop com.apple.racoon
    sudo launchctl start com.apple.racoon
}

dns() {
    sudo networksetup -setdnsservers Wi-Fi empty
}

dnsa() {
    sudo networksetup -setdnsservers Wi-Fi 192.168.1.1
}

dnsg() {
    sudo networksetup -setdnsservers Wi-Fi 8.8.8.8  
}

#---mkdir + cd
mkcd() {
    mkdir "$1"
    cd "$1"
}

#---change to the directory thats open in the finder
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}


#--for colored man output
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
