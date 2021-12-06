use Test;

use Modf;

# Basic tests for the modf routine

# Duplicate of the tests for the core

my %n;  # see test values and data in BEGIN block at the end

plan 4;

# test places
my ($int, $frac) = modf 1.23456;
is $int, 1;
is-approx $frac, 0.23456;
($int, $frac) = modf 1.23456, 3;
is $int, 1;
is $frac, 0.235;
