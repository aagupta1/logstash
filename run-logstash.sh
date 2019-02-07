cd /tmp/logstash
cat /tmp/kafka-hosts.cfg >> /etc/hosts
cat /etc/hosts
java -cp 'tools/benchmark-cli/build/libs/benchmark-cli.jar:*' org.logstash.benchmark.cli.Main --workdir=/tmp/benchmark2 --testcase=custom  --config=/tmp/logstash.cfg --local-path=/tmp/logstash_install/logstash-6.5.4/ 
