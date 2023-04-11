# the first stage of our build will use a maven 3.6.1 parent image
FROM gradle:8.0.2-jdk17 AS GRADLE_BUILD

WORKDIR /registry
  # copy the pom and src code to the container
COPY . .

  # package our application code
  #RUN gradle clean
RUN gradle clean build

  # the second stage of our build will use open jdk 8 on alpine 3.9
FROM openjdk:17-alpine3.14

WORKDIR /registry
  # copy only the artifacts we need from the first stage and discard the rest
COPY --from=GRADLE_BUILD /registry/build/libs/registry-0.0.1-SNAPSHOT.jar /registry/registry.jar

  # set the startup command to execute the jar
CMD ["java", "-jar", "/registry/registry.jar"]