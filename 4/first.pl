#!/usr/bin/env perl

#use strict;
use warnings;

#my $file = do { local $/ ; <> } ;
#my @passports = split /\n\n/, $file;
#my @p2 = s/\n/ / for @passports;
#
#print join(',', @passports);
#print join(',', @p2);

#do { local $/ ; <> } ;
my @p = split /\n\n/, do { local $/ ; <> }  ;
s/\n/ /g for @p;
my $ctr = 0;
foreach ( @p ) {
    my @tags = split / /;
    s/:.*$//g for @tags;
    my %tagmap = map { $_ => 1 } @tags; 
    if (exists($tagmap{"cid"})) {
        delete $tagmap{"cid"};
    }
    #print join('|', keys %tagmap), "\n";
    if (scalar keys %tagmap == 7) {
        $ctr += 1;
    }
}
print join("\n", @p), "\n" ;
print $ctr, "\n" ;

