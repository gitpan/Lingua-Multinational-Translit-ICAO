#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 5 }

use Lingua::Multinational::Translit::ICAO;

ok(Lingua::Multinational::Translit::ICAO::ml2icao('Œthel'), 'OEthel');
ok(Lingua::Multinational::Translit::ICAO::ml2icao('æon'), 'aeon');
ok(Lingua::Multinational::Translit::ICAO::ml2icao('qwerty'), 'qwerty');
ok(Lingua::Multinational::Translit::ICAO::ml2icao('phœnix'), 'phoenix');
ok(Lingua::Multinational::Translit::ICAO::ml2icao('Gæa'), 'Gaea');


exit;
