PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[32;1m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ '
export PS1

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000000

export EDITOR=vim
export SVN_EDITOR=vim

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home
export MAVEN_HOME=/Users/eric/dev/maven2.2.1
#export MAVEN_HOME=/usr/share/java/maven-3.0.3
export MAVEN_OPTS="-Xms512m -Xmx1024m"
export GROOVY_HOME=/Users/eric/dev/groovy-2.0.6

export PATH=/Users/eric/bin:$GROOVY_HOME/bin:/usr/local/mysql/bin:/usr/local/Cellar/subversion/1.7.8/bin:$PATH

if [ -f ~/.bash_alias ]; then
	source ~/.bash_alias
fi

if [ -f ~/.bash_completion_maven.bash ]; then
	source ~/.bash_completion_maven.bash
fi

if [ -f ~/.bash_completion_svn.bash ]; then
	source ~/.bash_completion_svn.bash
fi
