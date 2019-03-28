#!/usr/bin/perl -w
use DB_File;
use Fcntl;
my $filename=shift();
tie(%data, "DB_File", $filename, O_RDONLY) or die "error opening DB: $!";
my %cache=%data;
untie %data;
#print scalar keys(%data), " entries\n";
#foreach(sort (keys(%cache))) {
#  print "$_=$cache{$_}\n";
#}
print "entries: ",scalar keys %cache, "\n";

tie(%data, "DB_File", $filename.".new") or die "error opening output DB: $!";
%data=%cache;
untie(%data);
