#!bin/bash


ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "******************* ${ROOT_DIR}********************"

echo "**********************Building An IMAGE*******************"

#docker build -t jmeterupdated Container3
winpty docker build --no-cache -t jmeterupdated . 
echo "**********************Running a CONTAINER*****************"

#docker run -v "${ROOT_DIR}:/opt/apache-jmeter-5.5/bin/code" -d jmeterupdated/latest
chmod 777 Jmeterrun.sh

docker run -it jmeterupdated

echo "**********************Run Started***********"

echo "CONTAINER RAN SUCCESSFULLY"
sleep 2m

# echo "*************Running Jmeterun.sh file**********"

# #git config --global http.sslverify false
# #git clone https://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@github.com/svodhulu/Docker.git


# curtime=$(date +%d%m%Y%H%M%S)

# #Results Folder
# mkdir Results_${curtime}

# echo "Current time in epochtime $curtime"

# #Move to bin path
# cd ..

# sh jmeter.sh -n -t /opt/apache-jmeter-5.5/bin/DockerDemo/SampleTestScript_Google.jmx -l /opt/apache-jmeter-5.5/bin/DockerDemo/Results_${curtime}/Results_${curtime}.jtl -e -o /opt/apache-jmeter-5.5/bin/DockerDemo/Results_${curtime}/HTML_${curtime}
 
# #After Run Move to Repo
# cd DockerDemo

# sleep 1m
# #Push the code to repo
# git add .
# git config --global user.name "rsahay408"
# git config --global user.email "rupesh.sahay@qentelli.com"
# git commit -m "Results"
# git push
# echo "********Test executed SUCCESSFULLY*******"
