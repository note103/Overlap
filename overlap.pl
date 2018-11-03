#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Overlap;
use List::MoreUtils 'uniq';

my @data = <DATA>;

my $result = overlap(\@data);
for (sort @$result) {
    say $_;
}


__DATA__
