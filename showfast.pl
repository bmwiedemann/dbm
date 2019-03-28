#!/usr/bin/perl -w

use DB_File;
use Fcntl;
tie(%data, "DB_File", shift(), O_RDONLY) or die "error opening DB: $!";

#print scalar keys(%data), " entries\n";
while(my @a=each(%data)) {
  print "$a[0]=$a[1]\n";
}

untie(%data);

