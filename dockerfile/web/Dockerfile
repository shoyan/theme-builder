FROM httpd:2.4

RUN sed -i 's/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks MultiViews/' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's@#LoadModule negotiation_module modules/mod_negotiation.so@LoadModule negotiation_module modules/mod_negotiation.so@' /usr/local/apache2/conf/httpd.conf
