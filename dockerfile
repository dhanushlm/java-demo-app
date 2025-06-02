FROM openjdk:17
WORKDIR dhanush-java-app
COPY target/java-demo-app.jar .
CMD [ "java", "-jar", "java-demo-app.jar" ] 
