# Lingua/Multinational/Translit/ICAO.pm
#
# Copyright (c) 2007 Serguei Trouchelle. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

# History:
#  1.01  2007/07/04 Initial revision

=head1 NAME

Lingua::Multinational::Translit::ICAO -- Multinational characters transliteration into ICAO Doc 9303

=head1 SYNOPSIS

 use Lingua::Multinational::Translit::ICAO qw/ ml2icao /;

 print ml2icao('word', 'iso-8859-1'); 

=head1 DESCRIPTION

Lingua::Multinational::Translit::ICAO can be used for transliteration of multinational
characters in conformance with ICAO Doc 9303 Recommendations.

=head1 METHODS

=cut

package Lingua::Multinational::Translit::ICAO;

require Exporter;
use Config;

use strict;
use warnings;
use utf8;

use Text::Iconv;

our @EXPORT      = qw/ /;
our @EXPORT_OK   = qw/ ml2icao /;
our %EXPORT_TAGS = qw / /;
our @ISA = qw/Exporter/;

our $VERSION = "1.01";

my $table = q!1 1
Á A
À A
Â A
Ä AE
Ã A
Ă A
Å AA
Ā A
Ą A
á a
à a
â a
ä ae
ã a
ă a
å aa
ā a
ą a
Ć C
ć c
Ĉ C
ĉ c
Č C
č c
Ċ C
ċ c
Ç C
ç c
Đ D
đ d
Ď D
ď d
É E
È E
Ê E
Ë E
é e
è e
ê e
ë e
Ě E
ě e
Ė E
ė e
Ē E
ē e
Ę E
ę e
Ĕ E
ĕ e
Ĝ G
ĝ g
Ğ G
ğ g
Ġ G
ġ g
Ģ G
ģ g
Ħ H
ħ h
Ĥ H
ĥ h
ı i
Í I
Ì I
Î I
Ï I
İ I
Ĩ I
ĩ i
Ī I
ī i
Ĭ I
ĭ i
Į I
į i
Ĵ J
ĵ j
Ķ K
ķ k
Ł L
Ĺ L
Ľ L
Ļ L
Ŀ L
ł l
ĺ l
ľ l
ļ l
ŀ l
Ń N
Ň N
Ņ N
Ŋ N
ń n
ň n
ņ n
ŋ n
ñ n
Ñ N
Ø OE
Ó O
Ò O
Ô O
Ö OE
Õ O
ó o
ò o
ô o
õ o
ö oe
Ő O
ő o
Ō O
ō o
Ŏ O
ŏ o
Ŕ R
ŕ r
Ŗ R
ŗ r
Ř R
ř r
Ś S
Ŝ S
Ş S
Š S
ś s
ŝ s
ş s
š s
Ŧ T
Ť T
Ţ T
ŧ t
ť t
ţ t
Ú U
Ù U
Û U
Ü UE
ú u
ù u
û u
ü ue
Ũ U
Ŭ U
Ű U
Ů U
Ū U
Ų U
ũ u
ŭ u
ű u
ů u
ū u
Ŵ W
ŵ w
Ŷ Y
ŷ y
Ź Z
ź z
Ž Z
ž z
Ż Z
ż z
Ý Y
ý y
Ÿ Y
Þ TH
Æ AE
æ ae
þ th
Ĳ IJ
ĳ ij
Œ OE
œ oe
ß SS
2 2!;

our %ml2icao = split /\s+/, $table;

=head2 ml2icao ( $string, [ $encoding ])

This method converts $string from multinational character set to ICAO transliteration.

Optional $encoding parameter allows to specify $string's encoding (default is 'utf-8')

=cut

sub ml2icao {
  my $val = shift;
  my $lang = shift;
  my $enc = shift;
  if ($enc) {
    my $converter = Text::Iconv->new($enc, "utf-8");
    $val = $converter->convert($val);
  } # else think of utf-8
  my $res = '';
  utf8::decode($val);
#  foreach (split //, $val) {  -- benchmarks say it's slower...
  foreach (0 .. length $val) {
    $_ = substr($val, $_, 1);
    $_ = $ml2icao{$_} if defined $ml2icao{$_};
    $res .= $_;
  }
  return $res;
}

1;

=head1 AUTHORS

Serguei Trouchelle E<lt>F<stro@railways.dp.ua>E<gt>

=head1 COPYRIGHT

Copyright (c) 2007 Serguei Trouchelle. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 SEE ALSO

Lingua::Cyrillic::Translit::ICAO -- Cyrillic characters transliteration into ICAO Doc 9303

=cut
