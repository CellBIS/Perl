FROM perl:5.22.4
MAINTAINER Achmad Yusri Afandi - yusrideb@cpan.org

RUN apt-get update && apt-get install build-essential libdevel-cover-perl libjson-xs-perl libsass-dev libsass0 libsass0-dbg -y && \
cpanm Mojolicious && \
cpanm Mojolicious::Plugin::AssetPack && \
cpanm CSS::Sass && \
cpanm Imager::File::PNG && \
cpanm Cpanel::JSON::XS && \
cpanm File::ShareDir

WORKDIR /root

CMD ["perl5.22.4","-de0"]
