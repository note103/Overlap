#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Overlap;
use List::MoreUtils 'uniq';


my @data = <DATA>;

print for uniq(@data);

__DATA__
