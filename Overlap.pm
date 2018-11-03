package Overlap;
use strict;
use warnings;
use feature 'say';

use parent 'Exporter';
our @EXPORT = qw/overlap crush remove wave_parse order/;

our $VERSION = "0.01";


sub overlap {
    my $x = shift;
    my $y = shift;

    my %count;
    for my $source ( @$x, @$y ) {
        chomp $source;
        $count {$source}++;
    }

    my @overlap = grep {$count{$_} >= 2 && ! $_ =~ /\A\z/} keys %count;

    return \@overlap;
}


sub crush {
    my $x = shift;
    my $y = shift;

    my %crush;
    map { $crush{ $_ }++ } ( @$x, @$y );

    for (keys %crush) {
        if ($crush{$_} >= 2 || $_ =~ /\A\z/) {
            delete $crush{$_};
        }
    }

    my @result;
    for ( @$x, @$y ) {
        if ($crush{$_}) {
            push @result, $_;
        }
    }

    return \@result;
}

sub remove {
    my $whole = shift;
    my $part = shift;

    my %remove = map { $_ => 1 } @$part;

    my @result;
    for my $element (@$whole) {
        chomp $element;
        if (! $remove{$element}) {
            push @result, $element;
        }
    }
    return \@result;
}

sub wave_parse {
    my $data = shift;

    my @result;
    for my $line (@$data) {
        chomp $line;
        $line =~ s/～/〜/g;
        push @result, $line;
    }
    return \@result;
}


1;
