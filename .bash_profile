export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#-----for colored terminal--------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PATH=$PATH:~/code/Play20
export PATH="$PATH:/usr/local/mysql/bin"

export JAVA_OPTS='-Xmx2G -XX:MaxDirectMemorySize=512m -XX:PermSize=512m'
export MAVEN_OPTS='-Xms256m -XX:MaxPermSize=1024m -Xmx1024m'

export JAVA_HOME=$(/usr/libexec/java_home)

#---------basic aliases--------
alias ls='ls -GFp'
alias ..='cd ..'
alias ...='cd ../..'
alias stfu="osascript -e 'set volume output muted true'"
alias cpwd='pwd|tr -d "\n"|pbcopy'

alias iam='cd ~/code/security-iam-platform'
alias post='cd ~/code/postman-chrome/'
alias bolly='cd ~/AndroidStudioProjects/BollywoodHangman/'
alias nmcode='cd ~/code/newman'

alias mcis='mvn clean install -DskipTests'
alias mci='mvn clean install'
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

dnsw() {
    sudo networksetup -setdnsservers Wi-Fi 172.29.104.126
}

run() {
    currDir=$(pwd)
    if [[ "$currDir" == *iam-server ]]
    then
        export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n"  
        mvn jetty:run -Dcom.walmart.platform.config.runOnEnv="$1" -Dcom.walmart.platform.config.appName=platform-iam-server
    else
        echo "---- Not in /iam-server -----"
    fi    
}

rb() {
    currDir=$(pwd)
    if [[ "$currDir" == *iam-server ]]
    then
        cd ../iam-admin
        mcis
        cd ../iam-server
        mcis
        run local
    else
        echo "---- Not in /iam-server -----"
    fi    
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

##
# Your previous /Users/akane1/.bash_profile file was backed up as /Users/akane1/.bash_profile.macports-saved_2013-09-04_at_14:36:53
##

# MacPorts Installer addition on 2013-09-04_at_14:36:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


