#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Overlap;

my @arr1 = qw/orange banana apple lemon apple/;
my @arr2 = qw/orange banana/;

my $result = remove(\@arr1, \@arr2);
say for @$result;
