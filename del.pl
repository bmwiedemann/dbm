#!/usr/bin/perl -w

use DB_File;
tie(%data, "DB_File", shift @ARGV);

while(my $i=shift @ARGV) {
  delete $data{$i};
  print "deleted key $i\n";
}

#foreach(sort(keys(%data))) {
#  print "$_=$data{$_}\n";
#}

untie(%data);

