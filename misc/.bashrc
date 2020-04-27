# .bashrc
# this version comes from centos 7 install, with my added stuff on top

parse_git_branch() {

  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u: \[\e[33m\]\w\[\e[0m\]\[\033[31m\]$(parse_git_branch)\[\033[00m\]\n\$ '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias h=history
set -o vi
alias ls="ls -lFGahp"

alias ec2ssh="ssh -i ~/.ssh/id_rsa ec2-user@"

alias mkdir='mkdir -pv'

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

cd() { builtin cd "$@"; ls; }           # Always list directory contents upon 'cd'

mergedev () { git fetch origin develop:develop; git merge develop; }

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
