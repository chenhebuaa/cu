#!/usr/bin/perl 
#===============================================================================
#
#         FILE: regex.pl
#
#        USAGE: ./regex.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: chenhe (), chenhebuaa@gmail.com
#      COMPANY: www.qiyi.com
#      VERSION: 1.0
#      CREATED: 09/10/2013 09:37:16 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;


my $str = "8.9677E-002" ;


my @array = split("",$str);
print @array[0..4];
print "good" if $str=~ /.*?-0\d+/;
$str =~ s/(.*?-)0(\d+)/$1$2/;

print $str,"\n";



