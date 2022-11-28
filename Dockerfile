FROM openjdk:17-jdk as build

WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
COPY libs libs
RUN mkdir templates
RUN ./mvnw install:install-file -Dfile=libs/id-log-1.0.0-SNAPSHOT.jar -DgroupId=ee.ria.commons -DartifactId=id-log -Dversion=1.0.0 -Dpackaging=jar -DgeneratePom=true
ENTRYPOINT ["./mvnw","spring-boot:run"]