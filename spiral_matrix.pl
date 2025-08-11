#!/usr/bin/perl
#===============================================================================
#
#         FILE: spiral_matrix.pl
#
#        USAGE: perl spiral_matrix.pl [size]
#
#  DESCRIPTION: Print an N x N matrix filled in spiral order
#
#      OPTIONS: size - dimension of the matrix (default: 3)
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: OpenAI Assistant
#      VERSION: 1.0
#      CREATED: 2024-05-26
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

my $n = shift @ARGV || 3;
$n = 0 + $n;                # ensure numeric context

# initialize n x n matrix
my @matrix = map { [(0) x $n] } 1 .. $n;

my ($top, $bottom) = (0, $n - 1);
my ($left, $right) = (0, $n - 1);
my $value = 1;

while ($top <= $bottom && $left <= $right) {
    # left to right
    for my $col ($left .. $right) {
        $matrix[$top][$col] = $value++;
    }
    $top++;

    # top to bottom
    for my $row ($top .. $bottom) {
        $matrix[$row][$right] = $value++;
    }
    $right--;

    last if $top > $bottom; # check after adjusting boundaries

    # right to left
    for (my $col = $right; $col >= $left; $col--) {
        $matrix[$bottom][$col] = $value++;
    }
    $bottom--;

    last if $left > $right;

    # bottom to top
    for (my $row = $bottom; $row >= $top; $row--) {
        $matrix[$row][$left] = $value++;
    }
    $left++;
}

# print matrix
for my $row (@matrix) {
    print join(" ", @$row), "\n";
}

