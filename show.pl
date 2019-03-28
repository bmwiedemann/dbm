#!/usr/bin/perl -w

use DB_File;
use Fcntl;
tie(%data, "DB_File", shift(), O_RDONLY) or die "error opening DB: $!";

print scalar keys(%data), " entries\n";
#foreach(sort {$a<=>$b} (keys(%data))) {
#foreach(sort (keys(%data))) {
foreach(keys(%data)) { # unsorted
  print "$_=$data{$_}\n";
}

untie(%data);

