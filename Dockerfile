#FROM openjdk:18
#docker run --env-file ./config.txt -p 8070:8070 test
# docker run --network=opennetworkconnection -t userms --env-file ./config.txt -p 8071:8071 underwritems 
FROM maven:3.8.5-jdk-11


COPY . /

EXPOSE 8071
#RUN ["setenv","APP_SERVICE_HOST","localhost"]
RUN ["git","submodule","deinit","--all","-f"]
RUN ["git","submodule","init"]
RUN ["git", "submodule","sync"]
RUN ["git", "submodule","update"]
#RUN ["mvn", "clean","install","-DskipTests"]
RUN ["mvn", "clean","package","-DskipTests"]
WORKDIR /underwriter-microservice/target
CMD ["java","-jar","underwriter-microservice-0.1.0.jar"]
