FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.1

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin remove x-pack

COPY readonlyrest-1.16.4_es5.4.1.zip .
RUN bin/elasticsearch-plugin install file:/usr/share/elasticsearch/readonlyrest-1.16.4_es5.4.1.zip

COPY /config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml 

USER root
COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

RUN yum install -y openssl
USER elasticsearch

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
