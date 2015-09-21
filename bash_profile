if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

##
# Your previous /Users/eric/.bash_profile file was backed up as /Users/eric/.bash_profile.macports-saved_2013-01-07_at_10:41:45
##

# MacPorts Installer addition on 2013-01-07_at_10:41:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/eric/.jenv/bin/jenv-init.sh" ]] && source "/Users/eric/.jenv/bin/jenv-init.sh" && source "/Users/eric/.jenv/commands/completion.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
