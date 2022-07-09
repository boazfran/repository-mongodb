FROM registry.connect.redhat.com/percona/percona-server-mongodb-operator-containers

# change to root user
USER root

# security updates
RUN /usr/bin/microdnf update zlib cyrus-sasl-plain openssl-libs libxml2 glibc-minimal-langpack glibc-common rpm glibc libarchive rpm-libs libssh libssh-config

# add current folder to Docker container
RUN mkdir /app
COPY . /app

# add env variables
ENV MONGO_INITDB_DATABASE ireceptor

# switch to non-root user
RUN chown -R 1001 /app
USER 1001

# set the working directory so the indexes/query plans creation scripts
# will be able to find the indexes/query plans files.
WORKDIR /app

# run the mongo db 
CMD sh start_mongodb.sh

