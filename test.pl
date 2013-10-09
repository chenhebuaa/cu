#!/usr/bin/perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: i
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: chenhe (), chenhebuaa@gmail.com
#      COMPANY: www.qiyi.com
#      VERSION: 1.0
#      CREATED: 09/27/2013 05:58:42 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
my @PowerD = map {s/^\s+//;split /\s+/} <DATA> ;
print "@PowerD";


__DATA__
    0.00000E+00  0.00000E+00  6.69445E+02  8.53129E+01  8.59203E+02 
    9.73709E+01  4.11982E+01  5.44518E+00  1.38911E+01  1.80307E+00 

