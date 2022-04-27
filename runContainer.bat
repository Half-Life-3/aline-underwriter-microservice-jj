title underwriter microservice
docker build -t underwriterms .
docker run --network=opennetworkconnection --env-file ./config.txt -p 8070:8070 underwriter  
cmd /k