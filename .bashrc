#
# ~/.bashrc
#

# Environment Variables
[[ -f $HOME/.config/.env ]] && export $(envsubst < $HOME/.env)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Configurations
BASH_CONFIG_DIR=$XDG_CONFIG_HOME/bashrc.d/
BASH_CONFIGS=$(ls $BASH_CONFIG_DIR)
for CONFIG in $BASH_CONFIGS; do
    [[ -f $BASH_CONFIG_DIR/$CONFIG ]] && . $BASH_CONFIG_DIR/$CONFIG
done
