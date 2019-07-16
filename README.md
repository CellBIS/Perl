# Perl Docker Images for CellBIS Project

The purpose of this Docker Images for Perl App Project by CellBIS.
This images base on [Official Perl Docker Images](https://hub.docker.com/_/perl)

Perl Module bundle in all Docker Images :

| Name | Module |
| --- | --- |
| Main | Mojolicious   | 
| Dependency | Mojolicious::Plugin::AssetPack | 
| Dependency | CSS::Sass |
| Dependency | Imager::File::PNG |
| Dependency | Cpanel::JSON::XS |
| Dependency | File::ShareDir |

Perl version :

| Version | Docker Images |
| --- | --- |
| 5.16.3 | `cellbis/cellbis-perl:5.16` |
| 5.18.4 | `cellbis/cellbis-perl:5.18` |
| 5.20.3 | `cellbis/cellbis-perl:5.20` |
| 5.22.4 | `cellbis/cellbis-perl:5.22` |
| 5.24.4 | `cellbis/cellbis-perl:5.24` |
| 5.26.3 | `cellbis/cellbis-perl:5.26` |
| 5.28.2 | `cellbis/cellbis-perl:5.28` |
| 5.30.0 | `cellbis/cellbis-perl:5.30` |

If use `cellbis/cellbis-perl:latest` that means **Perl 5.30.0**
