export ZSH=~/.zsh

fpath=($fpath $ZSH/lib)
typeset -U fpath

# Load all of the config files
for config_file ($ZSH/ext/**/*.zsh) source $config_file
for config_file ($ZSH/ext_local/**/*.zsh) source $config_file

# Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt davd

# Disable globbing erros
unsetopt nomatch

# Initialize completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

autoload -U shorthands

export PATH="$HOME/bin:/usr/local/bin/:$PATH"

# Colorize terminal
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use vim as the editor
export EDITOR=vim
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Highlight search results in ack.
export ACK_COLOR_MATCH='red'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Skip forward/back a word with opt-arrow
bindkey "[C" forward-word
bindkey "[D" backward-word

# Ship to beginning/end of a line with cmd-arrow
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Make fn+backspace work
bindkey "\e[3~" delete-char

# Disable beep
setopt NO_BEEP

# History search cursor EOL
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# History substring search
bindkey "^[OA" history-substring-search-up
bindkey "^[OB" history-substring-search-down

# Jump to beginning/end of line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Use fn+Left/Right to search history with already entered text
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

alias grep="grep --color=auto"

# btw.. How to find out which sequence to bind using bindkey:
#   echo -n "<press CTRL+V and then the keys you want to bind>" | od -c
#
# Normally this would end up just with empty quotes so you have
# to press CTRL+V before pressing the keys as their sequence will
# then be inserted as text.
#
# This will return something like this:
#   thirteen:~() $ echo -n "^[[F" | od -c
#   0000000  033   [   F
#   0000003
#
# (on my macbook i pressed fn+arrow right)
# This means that "[F" is what you want to bind. This has to be prefixed
# with the escape sequence initiator "^[", so the whole thing is:
#
#   ^[[F
#
# Also make sure, when inserting the "bindkey" in your ZSH config, to not
# use the actual escape sequence "^[" but actually the two single characters
# ("written by hand") to not blow up many editors AND git diff
#
# Easy... right?

function mcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ } # stolen from @topfunky

# By @ieure; copied from https://gist.github.com/1474072
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
function up()
{
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

# navigate to project root (which has the .git folder) props to naps164
alias cdr='cd $(git rev-parse --show-toplevel)'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/david/.docker/completions $fpath)
autoload -Uz compinit
compinit

