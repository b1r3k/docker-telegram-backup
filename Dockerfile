FROM fabric8/java-jboss-openjdk8-jdk
MAINTAINER lukasz <dot> jachym <at> gmail <dot> com

ARG TG_VERSION=1.1.4

RUN curl -o /usr/local/bin/telegram_backup-$TG_VERSION.jar https://github.com/fabianonline/telegram_backup/releases/download/$TG_VERSION/telegram_backup.jar
RUN ln -s /usr/local/bin/telegram_backup-$TG_VERSION.jar /usr/local/bin/telegram_backup.jar
RUN mkdir /data
## this is the directory where the backup will be stored and should be already initialized with:
# java -jar /usr/local/bin/telegram_backup.jar --login
# java -jar /usr/local/bin/telegram_backup.jar --account <MOBILENUMBER>
VOLUME /data
USER nobody

CMD ["java", "-jar", "/usr/local/bin/telegram_backup.jar", "--target", "/data"]
