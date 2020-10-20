FROM registry.redhat.io/rhel-minimal
MAINTAINER NAME <asaswadk@xx.com>

### Required OpenShift Labels 
LABEL name="Test_App" \
      maintainer="asaswadk@xx.com" \
      vendor="RH_Ak" \
      version="1.0" \
      release="1" \
      run='docker run -d -p 8080:80 --name=testweb testwebserver' \
      summary="Test App" \
      description="It will show Date" \

### add licenses to this directory
COPY licenses /licenses

RUN yum install httpd -y

RUN echo "This container image was build on:" > /var/www/html/index.html
RUN date >> /var/www/html/index.html
EXPOSE 8080

# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
~                           
