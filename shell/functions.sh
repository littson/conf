
function svnLog(){ 
	svn log --stop-on-copy -v "$1"|grep -E '^\s+[AMDR]'|sort|uniq;
}

function ips () {
	# determine local IP address
	ifconfig | grep "inet " | awk '{ print $2 }'
}

function findjar () {
	find $HOME/.m2/repository -name $1
}

function findjava () {
	find . -name "$1.java"
}

function findgrep () {
	find $1 -iname $2 -exec grep -in -H $3 {} \;
}

function grepinpom () {
	find . -iname 'pom.xml' -exec grep -in -H $1 {} \;
}

function grepinxml () {
	find . -iname '*.xml' -exec grep -in -H $1 {} \;
}

function grepin () {
	find . -iname "*.$1" -exec grep -in -H $2 {} \;
}

function grepinjava () {
	find . -iname '*.java' -exec grep -in -H $1 {} \;
}

function mvnbuildpath () {
	sep=$1
	if [ "$sep" = "" ]; then
		sep=':'
	fi
	mvn dependency:build-classpath -Dmdep.pathSeparator="$sep" | grep -A1 'Dependencies classpath' | grep -v 'Dependencies classpath'
}

function mvndep () {
	mvn dependency:tree -Dincludes=:$1
}

function starttomcat() {
    /Users/eric/dev/tomcat/start.sh 8080
}

function killtomcat() {
    /Users/eric/dev/tomcat/stop.sh 8080
}

function restarttomcat() {
	killtomcat
   	sleep 3
   	starttomcat 
	tailtomcatlog
}

function tailtomcatlog() {
	tail -f /Users/eric/dev/tomcat/base_8080/logs/*
}

function starttomcat9080() {
    /Users/eric/dev/tomcat/start.sh 9080
}

function killtomcat9080() {
    /Users/eric/dev/tomcat/stop.sh 9080
}

function restarttomcat9080() {
	killtomcat9080
	sleep 5
	starttomcat9080
	tailtomcatlog9080
}

function tailtomcatlog9080() {
	tail -f /Users/eric/dev/tomcat/base_9080/logs/*
}

function svndiff() {
	BRANCH=$1
	ROOT=$2
	REV=`svn log --stop-on-copy|grep 'admin'|cut -d '|' -f1|tr -d ' '`
	for FILE in $(svn log --stop-on-copy -v $BRANCH|grep '^ '|tr -s ' '|sort -k3|uniq|cut -d ' ' -f3)
	do
		echo "svn diff -$REV:HEAD $ROOT$FILE"
		svn diff -$REV:HEAD $ROOT$FILE
	done
}

function keepsync() {
	while :
	do
		rsync -ru $1 $2
		#rsync -ruv $1 $2
		sleep 3
	done
}

function rsyncloop() {
	while :
	do
		rsync -avhe ssh $1 $2
		sleep 3
	done
}

function changeencoding() {
    vim +"argdo se bomb | se fileencoding=$3 | w" $(find $1 -type f -name $2)
}

function lsport() {
    lsof -nP -iTCP:$1 | grep LISTEN
}

function killgoagent() {
	kill -9 $(ps -ef|grep goagent|grep -v grep|awk '{print $2}')
}

function ecs() {
    F=/Users/eric/repos/yuntutv/work/docs/01项目/07服务运维/ecs_all.csv
    ack -i $1 $F
}

function tvesouecs() {
    printf '%s ' "$1"
    ecs $(nslookup "$1.tvesou.com" |ag Address|ag -v '#'|cut -d ':' -f 2)
}
function tvesou() {
    nslookup "$1.tvesou.com"
}

function openfungo() {
	mvim ~/repos/yuntutv/work/docs/fungo.md 
}

function fungo() {
    F=~/repos/yuntutv/work/docs/fungo.md 
	if [ "$2" != "" ]; then
		ack -i "-C$2" $1 $F
	else
		ack -i $1 $F
	fi
}

function openyoucai() {
	mvim ~/repos/yuntutv/work/docs/youcai/youcai.md 
}

function youcai() {
    F=~/repos/yuntutv/work/docs/youcai/youcai.md 
	if [ "$2" != "" ]; then
		ack -i "-C$2" $1 $F
	else
		ack -i $1 $F
	fi
}

function openlehoo() {
	mvim /Users/eric/repos/lehoo/doc/lehoo.md 
}

function lehoo() {
	if [ "$2" != "" ]; then
		ack -i "-C$2" $1 /Users/eric/repos/lehoo/doc/lehoo.md 
	else
		ack -i $1 /Users/eric/repos/lehoo/doc/lehoo.md
	fi
}
function start_redis() {
	redis-server /usr/local/etc/redis.conf
}

function dev_zookeeper_start {
    KAFKA_HOME=/Users/eric/dev/kafka/current
    $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
}

function dev_kafka_start {
    KAFKA_HOME=/Users/eric/dev/kafka/current
    $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
    #$KAFKA_HOME/bin/kafka-server-start.sh --zookeeper localhost:2181 $KAFKA_HOME/config/server.properties
}

function dev_flink_start {
    FLINK_HOME=/usr/local/Cellar/apache-flink/1.8.0/libexec/
    $FLINK_HOME/bin/start-cluster.sh
    # http://localhost:8081/#/overview
}
function dev_flink_stop {
    FLINK_HOME=/usr/local/Cellar/apache-flink/1.8.0/libexec/
    $FLINK_HOME/bin/stop-cluster.sh
}

function release_lehoo() {
    scp $1 lehoo_service1:~/release/
}

function docker_init_yuntu() {
    eval $(docker-machine env)
    docker create -v /var/lib/mysql --name dbstore mysql/mysql-server:5.6 /bin/true
    docker create -v /data --name redisstore6379 redis:3 /bin/true
    docker create -v /data --name redisstore6378 redis:3 /bin/true
}

function docker_run_yuntu() {
    eval $(docker-machine env)
    docker run --name db1 -d --volumes-from=dbstore -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql/mysql-server:5.6
    docker run --name redis6379 -d --volumes-from=redisstore6379 -p 6379:6379 jinsong/redis6379:1
    docker run --name redis6378 -d --volumes-from=redisstore6378 -p 6378:6378 jinsong/redis6378:1
}

function docker_start_yuntu() {
    eval $(docker-machine env)
    docker start db1
    docker start redis6379
    docker start redis6378
}

function r() {
    host=$1
	if [ "$host" = "" ]; then
		host='localhost'
	fi
    redis-cli -h $host -a 559ac5cb873eea9a5d2417f0667f110a   
}

function postgres_start() {
    postgres -D /usr/local/var/postgres
}

function postgres_client() {
    psql postgres
}

export XIAOAI_PULL_RTMP='rtmp://pull.live.nagezan.net/vod/'
export XIAOAI_PULL_ZEGO_RTMP='rtmp://rtmp.ws.nagezan.net/nagezan/'
export XIAOAI_PULL_M3U8_FLV='http://pull.live.nagezan.net/vod/'
export XIAOAI_PULL_KS_RTMP='rtmp://pull-ks.live.nagezan.net/live/'
export XIAOAI_PULL_KS_FLV='http://pull-ks-hdl.live.nagezan.net/live/'
export XIAOAI_FORWARD_PULL_RTMP='rtmp://plf1rtmp.live.nagezan.net/vod/'
export XIAOAI_FORWARD_PULL_M3U8='http://plf1.live.nagezan.net/vod/'
export XIAOAI_FORWARD_PULL_FLV='http://plf1flv.live.nagezan.net/vod/'

function xiaoai() {
    STREAM=$1
    ffplay "$XIAOAI_PULL_RTMP$STREAM"
}

function xiaoai_print() {
    STREAM=$1
    echo "$XIAOAI_PULL_RTMP$STREAM"
    echo "$XIAOAI_PULL_ZEGO_RTMP$STREAM"
    echo "$XIAOAI_PULL_M3U8_FLV$STREAM/playlist.m3u8"
    echo "$XIAOAI_PULL_M3U8_FLV$STREAM.flv"

    echo "$XIAOAI_PULL_KS_RTMP$STREAM"
    echo "$XIAOAI_PULL_KS_FLV$STREAM.flv"
    #echo "$XIAOAI_FORWARD_PULL_RTMP$STREAM"
    #echo "$XIAOAI_FORWARD_PULL_M3U8$STREAM.m3u8"
    #echo "$XIAOAI_FORWARD_PULL_FLV$STREAM.flv"
}
function xiaoai_play_ws() {
    STREAM=$1
    echo "ffplay $XIAOAI_PULL_M3U8_FLV$STREAM.flv"
    ffplay "$XIAOAI_PULL_M3U8_FLV$STREAM.flv"
}
function gaddcipush() {
    git add $1 && git ci -m $2 && git push origin develop
}
function openjd() {
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
    open ~/dev/android_re/jd-gui-osx-1.4.0/JD-GUI.app
}
function printlivea() {
    echo -n rtmp://pull-ws-xint.yuntuds.net/livea/$1 |pbcopy
}
function printliveb() {
    echo -n rtmp://pull-ws-xint.yuntuds.net/liveb/$1 |pbcopy
}
function printlivec() {
    echo -n rtmp://pull-ws-xint.yuntuds.net/livec/$1 |pbcopy
}
function playlivea() {
    ffplay rtmp://pull-ws-xint.yuntuds.com/livea/$1
    #ffplay rtmp://pull-ws-xint.yuntuds.net/livea/$1
}
function playvod() {
    STREAM="rtmp://pull-ws-xint.yuntuds.com/livea/vod$1"
    echo "playing $STREAM"
    ffplay $STREAM
}
function playliveb() {
    ffplay rtmp://pull-ws-xint.yuntuds.net/liveb/$1
}
function playlivec() {
    ffplay rtmp://pull-ws-xint.yuntuds.net/livec/$1
}
function playstreama_old() {
    ffplay rtmp://pull-ws-xint.xiaoyouzb.net/streama/$1
    #ffplay rtmp://pull-ws-xint.yuntuds.net/streama/$1
}
function playstreama_bk() {
    # push openpush.yuntuds.com
    ffplay rtmp://openpull-xint.yuntuds.com/streama/$1
}
function playstreama() {
    ffplay rtmp://pull-ws-xint.yuntuds.com/streama/$1
}

curl_time() {
    curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}
