FROM nginx:stable

COPY nginx.conf /etc/nginx/nginx.conf

RUN touch /var/run/nginx.pid && \
  chown -R www-data:www-data /var/run/nginx.pid && \
  chown -R www-data:www-data /var/cache/nginx

RUN mkdir -p /opt/repository/

COPY models/SIA /opt/repository/SIA

COPY ilisite.xml /opt/repository/
COPY ilimodels.xml /opt/repository/

COPY version.txt /opt/repository/

USER www-data
