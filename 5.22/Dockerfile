FROM perl:5.22.4
MAINTAINER yusrideb@cpan.org

RUN apt-get update && apt-get install build-essential libdevel-cover-perl libjson-xs-perl libsass-dev libsass0 libsass0-dbg -y && \
curl -L https://cpanmin.us | perl - App::cpanminus && \
curl -L https://cpanmin.us | perl - Mojolicious && \
curl -L https://cpanmin.us | perl - CSS::Sass && \
curl -L https://cpanmin.us | perl - Imager::File::PNG && \
curl -L https://cpanmin.us | perl - Cpanel::JSON::XS && \
curl -L https://cpanmin.us | perl - File::ShareDir

WORKDIR /root

CMD ["perl5.22.4","-de0"]
