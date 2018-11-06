load_module "${0:h}/fasd.zsh"

alias x='tmux'

alias cat='bat'
alias ,.='open .'

alias ttig='tmux splitw -bd -p 40 tig'
alias attach='tmux attach -t'

alias top='tmux splitw -bf -p 40'

alias gptag='git pull && ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=vendor . $(bundle list --paths)'

alias bi='bundle install'
alias md='mkdir'

alias gimme='gim'

# ==================

alias tree='tree -I node_modules'

alias tman='tmux splitw -h -p 30 man'
alias side='tmux splitw -fh -p 40'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fnl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -Enl 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -inl 1'
else
    alias history='fc -nl 1'
fi
# List direcory contents
alias .='open .'
alias af='ag -il'
alias be='bundle exec'
alias cl='curl -O'
alias co='ls | wc -l'
alias gviz='open -a /Applications/Graphviz.app/'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -lA'
alias lsa='ls -lha'
alias lt='ls -lth'
alias lth='ls -lth | head -11'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias pn='python'
alias qf='mdfind -onlyin .'
alias s='du -sh'
alias s='vim -S'
alias sl='ls'
alias sn='subl -n'
alias ss='less'
alias vi='vim'
alias vsi='pbpaste | vim -'
alias wcl='wc -l'
alias zshconfig='vim ~/.zshrc'

# python
alias ipython3='python3 -m IPython'

alias next='gco `git log --reverse --ancestry-path HEAD..master --format=%H | head -1`'
alias back='gco HEAD~'
