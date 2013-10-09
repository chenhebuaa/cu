#!/usr/bin/perl -w
use strict;

#trick
#use col1.col3 compare 
my $var = "";
my @array = grep { @_ = split/\s+/;$var eq $_[0].$_[2] ? 0 : ($var  = $_[0].$_[2])}  <DATA>;
print @array;

__DATA__
a 1 0
a 1 0
a 0 1
a 1 1
a 1 1
a 0 0
a 0 1
a 1 0
b 0 0
b 1 0
b 0 1
b 0 0
b 1 1
b 0 0
b 1 0
b 1 0
b 0 1
