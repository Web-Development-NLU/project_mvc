# syntax=docker/dockerfile:1

FROM maven:3.8.7-amazoncorretto-11 AS package

WORKDIR /home/app
COPY pom.xml .
COPY . .
RUN /usr/share/maven/bin/mvn package

FROM amazoncorretto:11.0.18 AS jdk

FROM tomcat:9.0.71-jdk11-corretto

WORKDIR /usr/local/tomcat

COPY --from=jdk /usr/lib/jvm/java-11-amazon-corretto ./jdk
RUN mv ./webapps.dist/* ./webapps
RUN rm -r ./webapps/ROOT
COPY --from=package /home/app/target/project_mvc ./webapps/ROOT
RUN set JRE_HOME=./jdk

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]