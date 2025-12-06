# syntax=docker/dockerfile:1

FROM modem7/docker-rickroll
ARG UID=101

USER root
COPY --link ./index.html /usr/share/nginx/html/guest/s/default/
RUN chown $UID:0 /usr/share/nginx/html/index.html
USER $UID
