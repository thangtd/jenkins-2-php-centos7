FROM openshift/jenkins-2-centos7

MAINTAINER Henry Tran <thangtd@gmail.com>
	
#######################################################
USER root
# install php requirements
RUN yum install -y php php-cli php-xsl \
  php-json php-curl php-mysqlnd \
  php-xdebug php-intl php-mcrypt php-pear \
  curl git ant php-mbstring \
 && yum clean all
 

# Create a Jenkins "HOME" for composer files.
RUN mkdir -p /var/lib/jenkins/composer
# Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/  --filename=composer

USER 1001
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/libexec/s2i/run"]
