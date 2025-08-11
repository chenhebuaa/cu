#!/usr/bin/perl 
#===============================================================================
#
#         FILE: sort_merge.pl
#
#        USAGE: ./sort_merge.pl  
#
#  DESCRIPTION: sort_merge.pl
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: chenhe (), chenhebuaa@gmail.com
#      COMPANY: www.qiyi.com
#      VERSION: 1.0
#      CREATED: 09/11/2013 05:52:02 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

my @name_array ;
my $hash;
while(<DATA>){
	#get serial from each line
	my ($seq,$min,$max, $sign, $serial, $name) = split(/\s+/);

	#in Python ,use in  for convenience
	unless (grep $_->[2] eq $serial ,@name_array){
		push  @name_array, [$seq,$sign,$serial,$name];
	} ;

	($min,$max) = ($max,$min) if $min > $max ; 	

	if($hash->{$serial}){
		sort_matrix($min,$max,$hash->{$serial});
	}
	else{
		push @{$hash->{$serial}},[$min,$max];
	}
	
}
###print sort result
for my $item( @name_array ){
	my $serial = $item->[2];
	for (0..$#{$hash->{$serial}}){
		print $item->[0]," ",$hash->{$serial}->[$_][0]," ",$hash->{$serial}->[$_][1]," ",$item->[1]," ",$serial,"_E",($_+1)," ",$item->[3],"\n"; 
	}
}

sub sort_matrix{
	my ($cur_min,$cur_max,$matrix) = @_;
	# record index  
	my @splice_index;
	for (0..$#$matrix){
		my $item_min = $matrix->[$_]->[0];
		my $item_max = $matrix->[$_]->[1];
		next if $cur_max < $item_min or $cur_min > $item_max;
		return if $cur_min >= $item_min and $cur_max <= $item_max;
		$cur_min  = $cur_min < $item_min ? $cur_min : $item_min;
		$cur_max = $cur_max < $item_max ? $item_max : $cur_max;	
		push @splice_index, $_;
	} 
	push @$matrix,[$cur_min,$cur_max];
	#print "@splice_index\n";

	for (0..$#splice_index){
		splice(@$matrix,$splice_index[$_]-$_,1);##This is trick
	}
	#print $cur_min,":",$cur_max,"\n";
}


__DATA__
refseq1 860921  861380  +       NM_152486       SAMD11
refseq1 861102  861593  +       NM_152486       SAMD11
refseq1 865335  865916  +       NM_152486       SAMD11
refseq1 866219  866669  +       NM_152486       SAMD11
refseq1 870952  871476  +       NM_152486       SAMD11
refseq1 874220  874709  +       NM_152486       SAMD11
refseq1 874455  875040  +       NM_152486       SAMD11
refseq1 876324  876886  +       NM_152486       SAMD11
refseq1 877316  877831  +       NM_152486       SAMD11
refseq1 877590  878068  +       NM_152486       SAMD11
refseq1 877739  878638  +       NM_152486       SAMD11
refseq1 878433  878957  +       NM_152486       SAMD11
refseq1 878878  879388  +       NM_152486       SAMD11
refseq1 879088  880161  +       NM_152486       SAMD11
refseq1 935046  935752  -       NM_021170       HES4
refseq1 934872  935367  -       NM_021170       HES4
refseq1 934706  935193  -       NM_021170       HES4
refseq1 934142  935012  -       NM_021170       HES4
refseq2 287813  288508  -       NM_001002919    FAM150B
refseq2 287383  288092  -       NM_001002919    FAM150B
refseq2 286090  286543  -       NM_001002919    FAM150B
refseq2 285923  286403  -       NM_001002919    FAM150B
refseq2 282911  283375  -       NM_001002919    FAM150B
refseq2 279363  280352  -       NM_001002919    FAM150B
