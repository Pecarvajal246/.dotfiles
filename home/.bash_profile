# .bash_profile
#
# GNOME starts through a login shell, so shortcuts and apps launched from it
# inherit the environment set in ~/.bash_env. Keep interactive-only setup
# (aliases, prompt, fnm env) in ~/.bashrc.

[ -f ~/.bash_env ] && . ~/.bash_env

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
