#!/usr/bin/env perl
#===============================================================================
#
#         FILE: mmp.pl
#
#        USAGE: ./mmp.pl  
#
#  DESCRIPTION: Parse mindmap file from Mindmester app to Plain Text
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: MAXIM SVIRIDENKO (), sviridenko.maxim@gmail.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 20.10.2019 20:26:39
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use JSON;
use Data::Dumper;

my $file = "map.json";
my $data = "";

open (MAP, "< $file") || die "Can't open file: $file";
$data = <MAP>;
close (MAP);


my $json = JSON->new->decode ($data);

print $json->{root}{title}."\n";

my $sec = $json->{root}{'children'};

foreach my $key (@{$sec}){

	print "\t".$key->{title}."\n";
	#print "\t".$key->{note}."\n\n" if ($key->{note});

	my $sec = $key->{children};
	
	foreach my $key(@{$sec}){
		print "\t\t".$key->{title}."\n";
		#print "\t\t".$key->{note}."\n\n" if ($key->{note});
		print "\n";

		my $sec = $key->{children};
	
		if($sec){

			foreach my $key(@{$sec}){
				print "\t\t\t".$key->{title}."\n";
				#print "\t\t\t".$key->{note}."\n\n" if ($key->{note});
				print "\n";

				my $sec = $key->{children};
	
				if($sec){
					
					foreach my $key(@{$sec}){
						print "\t\t\t\t".$key->{title}."\n";
						#print "\t\t\t\t".$key->{note}."\n\n" if ($key->{note});
						print "\n";

						my $sec = $key->{children};
		
						if($sec){

						};

					};
	
				};

			};
		};
	};
	
};
