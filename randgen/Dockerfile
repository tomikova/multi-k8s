FROM gradle:7.6.0-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle clean bootJar --no-daemon

FROM openjdk:17.0.1-jdk-slim
WORKDIR /application
COPY --from=build /home/gradle/src/build/libs/*.jar /application/app.jar
EXPOSE 7080
ENTRYPOINT ["java","-jar","/application/app.jar"]