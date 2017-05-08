FROM elasticsearch:5.3.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get update
RUN apt-get -y install vim curl

COPY readonlyrest-1.15.0_es5.3.2.zip .

RUN bin/elasticsearch-plugin install file:/usr/share/elasticsearch/readonlyrest-1.15.0_es5.3.2.zip

COPY /config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml 

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
