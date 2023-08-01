#
# ~/.bashrc
#

# Environment Variables
[[ -f $HOME/.env ]] && export $(envsubst < $HOME/.env)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Configurations
BASH_CONFIG_DIR=$XDG_CONFIG_HOME/bashrc.d/
BASH_CONFIGS=$(ls $BASH_CONFIG_DIR)
for CONFIG in $BASH_CONFIGS; do
    CONFIG_DIR_OR_FILE=$BASH_CONFIG_DIR/$CONFIG
    [[ -f $CONFIG_DIR_OR_FILE ]] && . $CONFIG_DIR_OR_FILE
done
