FROM art-hq.intranet.qualys.com:5001/qualys/cor/gradle:v1
USER root
RUN apt-get update
RUN cd /tmp && git clone https://github.com/aagupta1/logstash.git
RUN cd /tmp/logstash && ./gradlew clean assemble
RUN mkdir /tmp/logstash_install && cd /tmp/logstash_install && wget https://artifacts.elastic.co/downloads/logstash/logstash-6.5.4.zip && unzip logstash-6.5.4.zip && rm -rf logstash-6.5.4.zip
COPY tools/benchmark-cli/src/main/resources/org/logstash/benchmark/cli/cases/app-crashes.cfg  /tmp/logstash.cfg
COPY run-logstash.sh /tmp/run-logstash.sh
COPY kafka-hosts.cfg /tmp/kafka-hosts.cfg
ENTRYPOINT [ "sh", "/tmp/run-logstash.sh" ]
