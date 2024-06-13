# Build the application
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install

# Run the application
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/calebs-website.jar ./calebs-website.jar
EXPOSE 8080
CMD ["java", "-jar", "./calebs-website.jar"]



# Local machine:
    #FROM openjdk:17
    #EXPOSE 8080
    #ADD target/calebs-website.jar calebs-website.jar
    #ENTRYPOINT ["java", "-jar", "calebs-website.jar"]