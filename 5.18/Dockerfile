FROM perl:5.18.4
MAINTAINER Achmad Yusri Afandi - yusrideb@cpan.org

RUN cpanm App::cpanminus && \
cpanm Mojolicious && \
cpanm CSS::Sass && \
cpanm Imager::File::PNG && \
cpanm Cpanel::JSON::XS && \
cpanm File::ShareDir

WORKDIR /root

CMD ["perl5.18.4","-de0"]
