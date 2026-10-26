FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/library/eclipse-temurin:17-jre-alpine

ADD ./target/spring-gateway-*.jar /app.jar

RUN sh -c 'touch /app.jar'
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
