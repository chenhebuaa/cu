#!/usr/bin/perl 
#===============================================================================
#
#         FILE: stack.pl
#
#        USAGE: ./stack.pl  
#
#  DESCRIPTION: pop or push stack
#				show as Data::Dumper
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: chenhe (), chenhebuaa@gmail.com
#      COMPANY: www.qiyi.com
#      VERSION: 1.0
#      CREATED: 09/18/2013 11:50:39 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use Data::Dumper;

#stack op; show as Data::Dumper;
my $str= 'a,b,c,d,e,[e1,e2,[e21,e22,[e111,e222,e333],e33],e3],f';

my @stack;
my @array = split(/,/,$str);

push @stack,[]; 

for (@array){
	if (m/\[/){
		s/\[//g;
		my $ref = [];
		push @{$stack[-1]},$ref; ##build struct
		push @stack,$ref ;       #push stack
		push @{$stack[-1]},$_;
	}elsif (m/\]$/){
		s/\]//g;
		push @{$stack[-1]},$_;
		pop @stack;
	}else{
		push @{$stack[-1]},$_;
	}

}
print Dumper \@stack;
