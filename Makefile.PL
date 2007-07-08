use strict;
use warnings;
use 5.8.0;

use ExtUtils::MakeMaker;

WriteMakefile(
  'NAME'          => 'Lingua::Multinational::Translit::ICAO',
  'ABSTRACT'      => "Multinational characters transliteration into ICAO Doc 9303",
  'AUTHOR'        => 'Serguei Trouchelle <stro@railways.dp.ua>',
  'VERSION_FROM'  => 'ICAO.pm',
  'LICENSE'       => 'perl',
  'PREREQ_PM' => {
    'Encode' => 0,
  },
);
