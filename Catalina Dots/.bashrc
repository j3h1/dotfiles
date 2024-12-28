#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BLUE=$(echo -e '\001\033[38;5;18m\002')
PINK=$(echo -e '\001\033[38;5;161m\002')
RST=$(echo -e '\001\033[0m\002')
INV=$(echo -e '\001\033[7m\002')
UNINV=$(echo -e '\001\033[27m\002')

alias fucking='sudo'
alias download='yay -S'
alias undownload='yay -R'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\n ${PINK}╭ ${BLUE}${INV}\W${UNINV}\n ${PINK}╰${RST} '

echo -e "\n"
fastfetch
