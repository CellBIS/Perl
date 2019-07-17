FROM perl:5.16.3
MAINTAINER Achmad Yusri Afandi - yusrideb@cpan.org

RUN apt-get update && apt-get install build-essential libdevel-cover-perl libjson-xs-perl -y && \
cpanm Mojolicious && \
cpanm Mojolicious::Plugin::AssetPack && \
cpanm CSS::Minifier::XS && \
cpanm Imager::File::PNG && \
cpanm Cpanel::JSON::XS && \
cpanm File::ShareDir

WORKDIR /root

CMD ["perl5.16.3","-de0"]
