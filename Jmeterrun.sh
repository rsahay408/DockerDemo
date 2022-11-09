#!bin/bash

echo "*************Running Jmeterun.sh file**********"

#git config --global http.sslverify false
#git clone https://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@github.com/svodhulu/Docker.git


cd ..

#curTime= $(date+"%m-%d-%y_%H-%M-%S")
#curTime= $(echo $curTime|sed 's/-//g'|sed 's/_//g')

echo "Current time in epochtime $curTime"


sh jmeter -n -t /opt/apache-jmeter-5.5/bin/DockerDemo/SampleTestScript_Google.jmx -l /opt/apache-jmeter-5.5/bin/DockerDemo/Results_0711_NEW.jtl -e -o /opt/apache-jmeter-5.5/bin/DockerDemo/HTML_NEW_Results_0711
 
cd DockerDemo

sleep 1m
#Push the code to repo
git add .
git config --global user.name "rsahay408"
git config --global user.email "rupesh.sahay@qentelli.com"
git commit -m "Results"
git push
echo "********Test executed SUCCESSFULLY*******"
