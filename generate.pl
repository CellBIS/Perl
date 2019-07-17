#!/usr/bin/perl
package main;
use Mojo::Base -strict;

use Mojo::Util qw(dumper extract_usage);
use Cwd qw(getcwd);
use Getopt::Long qw(&GetOptions);

my $image_name = 'cellbis/cellbis-perl';

my $dockerPerl = CellBIS::DockerPerl->new();
my $command = CellBIS::DockerPerl::Command->new(
  images_name => $image_name,
  dir_location => getcwd
);

if (scalar @ARGV) {
  
  GetOptions
    'a|all' => sub { $command->generate_all },
    't|tags=s' => sub { $command->tags($_[1]) };
  
} else {
  say extract_usage;
}

package CellBIS::DockerPerl::Command;
use Mojo::Base '-base';

use Mojo::Util qw(dumper);

has 'images_name';
has 'dir_location';
has 'docker_perl';

sub generate_all {
  my $self = shift;
  
  for my $perl ($dockerPerl->list_perl_dir($self->{dir_location})) {
    say "Generate docker images for Perl $perl :";
    say "--" x 20;
    
    $self->tags($perl);
  }
  
}

sub tags {
  my ($self, $tags) = @_;
  
  my $docker_perl =  CellBIS::DockerPerl->new;
  
  say "Generate docker images for Perl $tags :";
  say "--" x 20;
  say $self->{images_name};
  say "docker build -t $self->{images_name} $self->{dir_location}/$tags\/";
  
  system "docker build -t $self->{images_name}:$tags $self->{dir_location}/$tags\/";
  
  my $docker_list = $docker_perl->list_docker_images($self->{images_name});
  my @result_docker = $docker_perl->search_docker_images($tags, $docker_list);
  
  my $hash_docker = $result_docker[0]->{hash};
  say "docker tag $hash_docker $self->{images_name}:$tags";
  say "docker push $self->{images_name}:$tags";
  
  system "docker tag $hash_docker $self->{images_name}:$tags";
  system "docker push $self->{images_name}:$tags";
}

package CellBIS::DockerPerl;
use Mojo::Base '-base';

sub search_docker_images {
  my ($self, $input, $list_docker) = @_;
  
  return grep { $_->{tag} eq $input } @$list_docker;
}

sub list_docker_images {
  my ($self, $docker_basename) = @_;
  my $data = `docker images | grep $docker_basename`;
  my @data = split /\n/, $data;
  my @for_list_docker;
  my @result;
  
  for my $dl (@data) {
    @for_list_docker = split /\s+/, $dl;
    push @result, {
      name => $for_list_docker[0],
      tag  => $for_list_docker[1],
      hash => $for_list_docker[2]
    };
  }
  
  return \@result;
}

sub list_perl_dir {
  my ($self, $loc_dir) = @_;
  
  opendir my $dir, $loc_dir or die "Cannot open directory: $!";
  my @files = sort(grep { $_ =~ /^5\./ } readdir $dir);
  closedir $dir;
  
  return @files;
}

1;

=encoding utf8

=head1 NAME

generate.pl - Generate Docker images for publishing to dockerhub

=head1 SYNOPSIS

  -----------------------------------
  Usage: generate.pl
  generate.pl -a | generate.pl --all
  generate.pl -t <perl-dir> | generate.pl --tags <perl-dir>
  
  Options:
    -a, --all               | generate all perl docker images and upload
    -t, --tags <perl-dir>   | generate specific perl version
    
  Perl Dir :
    - 5.16
    - 5.18
    - 5.20
    - 5.22
    - 5.24
    - 5.26
    - 5.28
    - 5.30

=head1 DESCRIPTION

The purpose of command for generate docker images
for publishing to dockerhub

=head1 AUTHOR

Achmad Yusri Afandi, E<lt>yusrideb@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by Achmad Yusri Afandi

=cut
