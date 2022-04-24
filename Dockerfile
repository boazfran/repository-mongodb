FROM registry.connect.redhat.com/percona/percona-server-mongodb-operator-containers

# change to root user
USER root

# add current folder to Docker container
RUN mkdir /app
COPY . /app

# switch to non-root user
RUN chown -R 1001 /app
USER 1001

# set the working directory so the indexes/query plans creation scripts
# will be able to find the indexes/query plans files.
WORKDIR /app

# run the mongo db 
CMD sh start_mongodb.sh

