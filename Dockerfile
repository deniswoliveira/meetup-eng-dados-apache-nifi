FROM apache/nifi:1.13.2

USER root

COPY --chown=nifi:nifi dataset/netflix_titles.csv /opt/dataset/netflix_titles.csv
COPY --chown=nifi:nifi conf/flow.xml.gz /opt/nifi/nifi-current/conf/flow.xml.gz

RUN mkdir -p /opt/jdbc
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar /opt/jdbc/mysql-connector-java-8.0.27.jar
RUN chown -R nifi:nifi /opt/jdbc

USER nifi

EXPOSE 10000/tcp
EXPOSE 8000/tcp 
EXPOSE 8080/tcp 
EXPOSE 8443/tcp