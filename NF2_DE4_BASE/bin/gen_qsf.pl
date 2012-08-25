#!/usr/bin/perl -w
# vim:set shiftwidth=2 softtabstop=2 expandtab:

#################################################################
# Generate assignments to project QSF
#
# $Id: gen_qsf.pl 5761 2009-07-15 21:06:34Z dpk $
#
#################################################################


#my @argList = split /\s+/, $ARGV;
#my @splitList=split /\s+/, $fileList;
my @argList=@ARGV;

my $toplevel=$argList[0];
my $filetype=$argList[1];

shift(@argList);
shift(@argList);

#print "Hello $toplevel $filetype $fileList\n";
open FILE, ">>", $toplevel or die $!;
foreach(@argList) {
   	print "Hello\n";
	if($filetype eq "verilog") {
		print FILE "\nset_global_assignment -name VERILOG_FILE ".$_;
	}

	if($filetype eq "qip") {
		print FILE "\nset_global_assignment -name QIP_FILE ".$_;
	}


	if($filetype eq "sdc") {
		print FILE "\nset_global_assignment -name SDC_FILE ".$_;
	}
}

close FILE;

