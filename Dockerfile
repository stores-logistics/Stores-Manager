FROM node

LABEL maintainer Camilo Nieto <caenietoba@unal.edu.co>

# Set the work directory
WORKDIR /www/storesManager

# Good to have stuff
RUN npm install pm2 -g
RUN npm install babel-cli -g

#RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
#RUN apt-get update && apt-get install apt-file -y && apt-file update && apt-get install vim -y 
# && apt-get install -y wget

# Use Cache please
ADD package.json /www/storesManager
RUN npm install

# Add application files
ADD . /www/storesManager

COPY wait-for-it.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Entrypoint script
RUN cp docker-entrypoint.sh /usr/local/bin/ && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose the port
EXPOSE 4005

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]


#ENV DOCKERIZE_VERSION v0.6.0
#RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

#CMD dockerize -wait tcp://db:3306 -timeout 60m npm start


## THE LIFE SAVER
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

## Launch the wait tool and then your application
CMD /wait