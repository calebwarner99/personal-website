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
VOLUME /certs
EXPOSE 8080
CMD ["java", "-Djavax.net.ssl.keyStore=/certs/fullchain.pem", "-Djavax.net.ssl.keyStorePassword=${KEYSTORE_PASSWORD}", "-Djavax.net.ssl.trustStore=/certs/fullchain.pem", "-Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASSWORD}", "-jar", "./calebs-website.jar"]



# # Local machine:
#    FROM openjdk:17
#    EXPOSE 8080
#    ADD target/calebs-website.jar calebs-website.jar
#    ENTRYPOINT ["java", "-jar", "calebs-website.jar"]