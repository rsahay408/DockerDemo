#!bin/bash

echo "*************Running Jmeterun.sh file**********"

#git config --global http.sslverify false
#git clone https://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@github.com/svodhulu/Docker.git


curtime=$(date +%d%m%Y%H%M%S)

echo "Current time in epochtime $curtime"

cd ..
sh jmeter.sh -n -t /opt/apache-jmeter-5.5/bin/Docker/SampleTestScript_Google.jmx -l /opt/apache-jmeter-5.5/bin/Docker/Results_${curtime}.jtl -e -o /opt/apache-jmeter-5.5/bin/Docker/HTML_${curtime}
 
cd Docker

sleep 1m
#Push the code to repo
git add .
git config --global user.name "SaiKumar"
git config --global user.email "saikumar.vodhulu@qentelli.com"

git commit -m "Results"
git push


echo "********Test executed SUCCESSFULLY*******"
