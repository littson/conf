PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[32;1m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ '
export PS1


if [ -f ~/.shell/alias ]; then
	source ~/.shell/alias
fi

if [ -f ~/.shell/functions ]; then
	source ~/.shell/functions
fi

if [ -f ~/.shell/variables ]; then
	source ~/.shell/variables
fi

if [ -f ~/.bash_completion_maven.bash ]; then
	source ~/.bash_completion_maven.bash
fi

if [ -f ~/.bash_completion_svn.bash ]; then
	source ~/.bash_completion_svn.bash
fi

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/eric/.jenv/bin/jenv-init.sh" ]] && source "/Users/eric/.jenv/bin/jenv-init.sh" && source "/Users/eric/.jenv/commands/completion.sh"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
