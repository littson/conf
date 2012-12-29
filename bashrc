PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[32;1m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ '
export PS1

export EDITOR=vim
export SVN_EDITOR=vim

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home
export MAVEN_HOME=/usr/share/java/maven-3.0.3
export MAVEN_OPTS="-Xms512m -Xmx1024m"
export GROOVY_HOME=/Users/eric/dev/groovy-2.0.6

export PATH=$GROOVY_HOME/bin:/usr/local/mysql/bin:/usr/local/Cellar/subversion/1.7.8/bin:$PATH

if [ -f ~/.bash_alias ]; then
	source ~/.bash_alias
fi
