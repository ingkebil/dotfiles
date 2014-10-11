# .bashrc
# kenny.billiau@scilifelab.se

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Notify of bg job completion immediately
set -o notify
# Prevent accidental overwrite of existing files
set -o noclobber
# Autocomplete hostnames
shopt -s hostcomplete

# aliases
alias ls='ls --color=auto'
alias ll='ls -l'

# HISTORY #
export HISTCONTROL=ignoredups:erasedups  # avoid duplicates..
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append history entries..

# vi vi vi
set -o vi
export EDITOR=vim

# paths
export PATH=$PWD/ensembl-git-tools/bin:$PATH
export RLWRAP_EDITOR="vim +%L"

# prompt
source "$HOME/.bash_prompt"

# https://github.com/andsens/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
alias homeshick='source $HOME/.homesick/repos/homeshick/bin/homeshick.sh'
