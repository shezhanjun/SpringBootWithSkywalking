FROM openjdk:8-jre-alpine

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    SPRINGBOOT_SLEEP=0 \
    JAVA_OPTS=""
    
add ./agent  /home/tanjie/agent   

# Add a tanjie user to run our application so that it doesn't need to run as root
RUN adduser -D -s /bin/sh tanjie
WORKDIR /home/tanjie

ADD entrypoint.sh entrypoint.sh
RUN chmod 755 entrypoint.sh && chown tanjie:tanjie entrypoint.sh
USER tanjie

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 8080 5701/udp

ADD ./target/*.jar app.jar

