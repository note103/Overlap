#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Overlap;
use List::MoreUtils 'uniq';

my $switch = 'crush';

my @data = <DATA>;
my $result;

if ($switch eq 'overlap') {
    $result = overlap(\@data);
    say for @$result;
}
elsif ($switch eq 'crush') {
    $result = crush(\@data);
    print for @$result;
}
elsif ($switch eq 'uniq') {
    print for uniq(@data);
    exit;
}

__DATA__
