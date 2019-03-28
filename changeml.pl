#!/usr/bin/perl -w

use MLDBM qw(DB_File Storable);
use Fcntl;
tie(%data, "MLDBM", shift(), O_RDWR, 0666) or die "error opening DB: $!";

print scalar keys(%data), " entries\n";

# change here
my $d=$data{"43"};
print "old value: $d->[11]->{ownerid}\n";
$d->[11]->{ownerid}=0;
$data{"43"}=$d;

untie(%data);


