# Source Image
FROM node:alpine

# Build Arguments
ARG BUILD_DATE
ARG VERSION

# Volumes
### This is the primary volume for configuration files
VOLUME /meshcentral/meshcentral-data
### This is the primary volume for uploaded data
VOLUME /meshcentral/meshcentral-files
### This is the primary volume for database backups
VOLUME /meshcentral/meshcentral-backup


# Environment Variables
ENV MONGODB_URL=
ENV MONGODB_NAME=
ENV DB_ENCRYPT_KEY=
ENV AGENT_PORT=
ENV CERT=


# We are exposing two ports: 80/443 for the web management interface. Optionally we can also (in config.json)
# expose the intel AMT port (4433) and an agent port (defaults to 8800, can be whatever)
EXPOSE 80 443

# Set the staging environment
WORKDIR /staging/scripts
WORKDIR /staging

# Copy across the scripts folder
COPY scripts/* ./scripts/

# Set permissions for all scripts. We do not want normal users to have write
# access to the scripts
RUN chown -R 0:0 scripts
RUN chmod -R 755 scripts

# Build the image. This build runs as root
RUN /1-image-build.sh

# Change the user to node.
USER node

WORKDIR /meshcentral

ENTRYPOINT /bin/sh /2-initialise.sh