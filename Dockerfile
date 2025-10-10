# syntax=docker/dockerfile:1

# This is the base image used by modem7/docker-rickroll.  It's included here so
# Dependabot will update this file when a new version of the nginx image is
# released.  That file update triggers a new release of this project.
FROM nginxinc/nginx-unprivileged:1.29.2-alpine

# Here's the real base image we want to use.  The only tag it has is latest, so dependabot can't detect new versions.
FROM modem7/docker-rickroll
ARG UID=101

USER root
COPY --link ./index.html /usr/share/nginx/html/guest/s/default/
RUN chown $UID:0 /usr/share/nginx/html/index.html
USER $UID

