FROM openjdk:17-jdk-alpine

WORKDIR /app

RUN apk add --no-cache curl

RUN curl -L https://github.com/admin8800/dujiaokabot/releases/download/bot618/bot.jar -o bot.jar

ENTRYPOINT ["java", "-jar", "bot.jar"]