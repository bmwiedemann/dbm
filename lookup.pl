#!/usr/bin/perl -w

use DB_File;
use Fcntl;
tie(%data, "DB_File", shift(), O_RDONLY) or die "error opening DB: $!";

foreach my $k (@ARGV) {
	print "$k=$data{$k}\n";
}

untie(%data);

