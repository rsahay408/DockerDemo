#!bin/bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "******************* ${ROOT_DIR}********************"

echo "**********************Building An IMAGE*******************"

docker build -t jmeterupdated .
#winpty docker build --no-cache -t jmeterupdated . 
echo "**********************Running a CONTAINER*****************"

#docker run -v "${ROOT_DIR}:/opt/apache-jmeter-5.5/bin/code" -d jmeterupdated/latest
chmod 777 Jmeternew.sh

docker run -it jmeterupdated

echo "**********************Run Started***********"

echo "CONTAINER RAN SUCCESSFULLY"
sleep 2m
