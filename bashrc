function parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

function gpo() {
    if [[ $1 -eq "this" ]]; then
        B=$(parse_git_branch | cut -d'(' -f 2 | cut -d')' -f 1 | sort);
        git push origin $B
    else
        git push origin $@
    fi
}
alias vv='vim ~/.vimrc'

export PATH=~/bin:/usr/local/bin:$PATH
alias sdr='screen -d -r '
alias pgn='pgrep -a node'

alias gs='git status'
alias gd='git diff'

function updir(){
    screen -X eval "chdir $PWD"
}

alias nr='npm run '

alias knex='npx knex'


# optimized for git completion
if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
fi
