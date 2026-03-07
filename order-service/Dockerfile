FROM maven:amazoncorretto

USER root
WORKDIR /app/java
COPY . ./
RUN  mvn package
RUN ls -ltR
CMD ["/bin/sh", "-c", "java -jar target/order-service-0.0.1-SNAPSHOT.jar"]


