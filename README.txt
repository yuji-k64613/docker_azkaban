docker build -t yuji/azkaban .
docker run -it -p 8081:8081 --name azkaban01 yuji/azkaban
http://172.17.8.101:8081/index
