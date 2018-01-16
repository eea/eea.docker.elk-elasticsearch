FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.1.0

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

COPY readonlyrest-1.16.15_es6.1.0.zip ./readonlyrest.zip

COPY /config/elasticsearch.yml /elasticsearch.yml
COPY /config/readonlyrest.yml /readonlyrest.yml

USER root
COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

RUN yum install -y openssl

USER elasticsearch

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
