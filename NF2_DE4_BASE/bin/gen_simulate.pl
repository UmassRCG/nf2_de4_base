#!/usr/bin/perl -w
# vim:set shiftwidth=2 softtabstop=2 expandtab:

#################################################################
# Generate assignments to project QSF
#
# $Id: gen_qsf.pl 5761 2009-07-15 21:06:34Z dpk $
#
#################################################################

use File::Basename;
#my @argList = split /\s+/, $ARGV;
#my @splitList=split /\s+/, $fileList;
my @argList=@ARGV;

my $toplevel=$argList[0];
my $filetype=$argList[1];

#shift(@argList);
shift(@argList);
shift(@argList);

#print "Hello $toplevel $filetype $fileList\n";
open FILE, ">>", $toplevel or die $!;

#foreach(@argList) {
#	my $dirname = dirname($_);
#	print FILE "\nvlog -mfcu -vlog01compat -work work +incdir+".$dirname." ".$_;
         
#}
my $sep=" ";
my $fileList = join($sep,@argList);
if($filetype eq "verilog") {
print FILE "\nvlog -mfcu -vlog01compat -work work ".$fileList;
}

if($filetype eq "megafunction") {
print FILE "\nvlog -mfcu -vlog01compat -work work ".$fileList;
}

if($filetype eq "simulation") {
print FILE "\nvsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiv_hssi_ver -L stratixiv_pcie_hip_ver -L stratixiv_ver -L rtl_work -L work -voptargs=\"+acc\" ethernet_port_interface_tb";
}
close FILE;

