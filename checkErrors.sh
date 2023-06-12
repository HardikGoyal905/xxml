errorCount=0

countErrors () {
    file='log.txt'  

    i=1  
    while read line; do  
    i=$((i+1))  
    done < $file  

    i=$((i-3))
    errorCount=$i
}

curl -o checkStyle.jar -L https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.12.0/checkstyle-10.12.0-all.jar
curl -o configureStyle.xml -L https://raw.githubusercontent.com/HardikGoyal905/xxml/main/filecheck.xml

touch log.txt
java -jar checkStyle.jar -c configureStyle.xml cicd-pipe-test > log.txt || true

countErrors
