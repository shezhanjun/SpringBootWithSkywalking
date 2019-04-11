FROM openjdk:8-jre-alpine

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    SPRINGBOOT_SLEEP=0 \
    JAVA_OPTS="" \
    SW_AGENT_NAMESPACE=test \
    SW_AGENT_NAME=springbootwithskywalking \
    SW_AGENT_COLLECTOR_BACKEND_SERVICES=139.199.77.75:11800 \
    SW_AGENT_SAMPLE=-1
    
    
# Add a tanjie user to run our application so that it doesn't need to run as root
RUN adduser -D -s /bin/sh tanjie
WORKDIR /home/tanjie

ADD ./agent  /home/tanjie/agent 
ADD entrypoint.sh entrypoint.sh
RUN chmod 755 entrypoint.sh && chown tanjie:tanjie entrypoint.sh && chown -R tanjie:tanjie agent
USER tanjie

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 8080 5701/udp

ADD ./target/*.jar app.jar

