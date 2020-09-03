#!/usr/bin/perl
use strict;
use warnings;

my $acc2taxid = $ARGV[1];

open(INPUT,$ARGV[0]) || die("Cannot open file!");

while(<INPUT>){
	my $line = $_;
	chomp($line);
	if ( $line =~ /^gi/){ next; }
	my @spl = split("\t",$line);
	my $orig_acc = $spl[1];
	@spl = split(/\./,$orig_acc);
	my $acc = $spl[0];
	my $output = `grep '$acc' $acc2taxid`;
	if ($? == 0){
		@spl = split("\t",$output);
		print "$acc\t$spl[2]\n";
	}else{
		print "$acc\tnot_found\n";
	}
}
close(INPUT);
	
