#!/usr/bin/perl -w

use DB_File;
tie(%data, "DB_File", shift @ARGV);

my $i=shift @ARGV;
my $val=shift @ARGV;
$data{$i}=$val;

#foreach(sort {$a<=>$b} (keys(%data))) {
#  print "$_=$data{$_}\n";
#}

untie(%data);

