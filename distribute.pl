#!/usr/bin/perl 
#===============================================================================
#
#         FILE: distribute.pl
#
#        USAGE: ./distribute.pl  
#
#  DESCRIPTION: distribute N task to M person
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: chenhe (), chenhebuaa@gmail.com
#      COMPANY: www.qiyi.com
#      VERSION: 1.0
#      CREATED: 09/10/2013 05:55:30 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;


my($task_num,$workers_num) = ($ARGV[0],$ARGV[1]);


print "We have $task_num tasks\n";
print "We have $workers_num tasks\n";

my $rest = $task_num %  $workers_num;
for  (1..$workers_num){
	my $i = int($task_num/$workers_num);
	if ($rest >  0 ){
		$i += 1;
		$rest -= 1; 
	}
	print $i,"\n";
} 
