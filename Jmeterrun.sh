#!bin/bash
echo "*************Running Jmeterun.sh file**********"
curtime=$(date +%d%m%Y%H%M%S)
echo "Current time in epochtime $curtime"
cd ..

sh jmeter.sh -n -t /opt/apache-jmeter-5.5/bin/DockerDemo/SampleTestScript_Google.jmx -l /opt/apache-jmeter-5.5/bin/DockerDemo/Results_${curtime}.jtl -e -o /opt/apache-jmeter-5.5/bin/DockerDemo/HTML_${curtime}
cd DockerDemo

sleep 1m
#Push the code to repo
git add .
git config --global user.name "rsahay408"
git config --global user.email "rupesh.sahay@qentelli.com"
git commit -m "Results"
git push
echo "********Test executed SUCCESSFULLY*******"
