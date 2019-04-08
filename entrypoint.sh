#!/bin/sh

echo "The application will start in ${SPRINGBOOT_SLEEP}s..." && sleep ${SPRINGBOOT_SLEEP}
exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -javaagent:/home/tanjie/agent/skywalking-agent.jar -jar "${HOME}/app.jar" "$@"
