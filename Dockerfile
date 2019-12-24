# this is my first dockerfile
# version 1.0
# author: wenzi

# base images
FROM centos

#MAINTAINER
MAINTAINER wenzi

#ADD
ADD nginx-1.17.6.tar.gz /usr/local/src

#RUN
RUN yum install -y wget gcc gcc-c++ make openssl openssl-devel zlib zlib-devel pcre pcre-devel
RUN useradd -s /sbin/nologin -M www

#WORKDIR
WORKDIR /usr/local/src/nginx-1.17.6

RUN ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_ssl_module --with-http_stub_status_module --with-pcre && make && make install

RUN echo "daemon off;" >> /usr/local/nginx/conf/nginx.conf

ENV PATH /usr/local/nginx/sbin:$PATH
EXPOSE 80

CMD ["nginx"]
