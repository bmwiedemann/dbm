#!/usr/bin/perl -w

use MLDBM qw(DB_File Storable);
use Fcntl;
tie(%data, "MLDBM", shift(), O_RDONLY, 0666) or die "error opening DB: $!";

sub printdata { my($name, $d, $l)=@_;
	$r=ref($d);
	if($r eq "HASH") {
		print "$name=hash {\n";
		foreach my $h (sort (keys(%$d))) {
			my $e=$$d{$h};
			printdata("$name=hash{$h}", $e, $l+1);
		}
		print(("\t" x $l)."}\n");
	} elsif($r eq "ARRAY") {
		print "$name=array (\n";
		my $i=0;
		foreach my $n (@$d) {
			printdata("$name=array[$i]",$n,$l+1);
			$i++;
		}
		print(("\t" x $l).")\n");
	} else {
		my $e=$d;
		if(!defined($e)) { $e="undefined"; }
		print (("\t" x $l) , "$name=$e\n");
	}
}

print scalar keys(%data), " entries\n";
printdata("DB",\%data,0);
untie(%data);


