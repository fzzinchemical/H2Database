FROM debian:stable

RUN apt-get update && apt-get install curl unzip -y 

FROM eclipse-temurin:21-jre-jammy

ENV H2DATA /h2-data

RUN mkdir /docker-entrypoint-initdb.d

VOLUME ./h2-data

EXPOSE 8082 9092

COPY ./h2.jar /h2/bin/h2.jar

CMD java -cp /h2/bin/h2.jar org.h2.tools.Server \
  -web -webAllowOthers -tcp -tcpAllowOthers -ifNotExists -baseDir $H2DATA