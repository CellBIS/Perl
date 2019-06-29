FROM perl:5.16.3
MAINTAINER Achmad Yusri Afandi - yusrideb@cpan.org

RUN cpanm Mojolicious && \
cpanm CSS::Sass && \
cpanm Imager::File::PNG && \
cpanm Cpanel::JSON::XS && \
cpanm File::ShareDir

WORKDIR /root

CMD ["perl5.16.3","-de0"]
