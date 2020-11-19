FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.8.13

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

COPY readonlyrest-1.24.0_es6.8.13.zip ./readonlyrest.zip

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
