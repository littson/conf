if [ "$1" == ""  ]; then
    echo "usage: loop-check.sh jarDir  duplicateJarFile duplicateClassFile"
    exit 0
fi
if [ "$2" == ""  ]; then
    echo "usage: loop-check.sh jarDir  duplicateJarFile duplicateClassFile"
    exit 0
fi
if [ "$3" == ""  ]; then
   echo "usage: loop-check.sh jarDir  duplicateJarFile duplicateClassFile"
    exit 0
fi


echo "" >  $2
echo "" >  $3

find $1 -name "*.jar" -exec jar tf {} \; | grep ".*\.class$" | sort | uniq -c | sort -nr | while read line
do
    echo $line | awk '{if($1 > 1){print $2" "$1}}'| while read clazz count
	do
		echo "$count $clazz" >> $3
                a=`grep $clazz $1/*.jar | awk '{print $2}'`                                                                   
                echo $a >> $2
	done

done

exit 0
