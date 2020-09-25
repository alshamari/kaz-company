FROM openjdk:7
COPY my-app/target/my-app-1.0-SNAPSHOT.jar /usr/src/myapp/my-app-1.0-SNAPSHOT.jar
CMD ls
WORKDIR /usr/src/myapp
EXPOSE 8080
CMD java -jar my-app-1.0-SNAPSHOT.jar
