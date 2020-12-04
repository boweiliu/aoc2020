#!/usr/bin/env perl

use warnings;

sub flat(@) {
        return map { ref eq 'ARRAY' ? @$_ : $_ } @_;
}

my @p = split /\n\n/, do { local $/ ; <> }  ;
s/\n/ /g for @p;
my $ctr = 0;
foreach ( @p ) {
    my @tags = split / /;
    # s/:.*$//g for @tags;
    my %tagmap = map { split /:/ } @tags; 
    if (exists($tagmap{"cid"})) {
        delete $tagmap{"cid"};
    }
    #print join('|', keys %tagmap), "\n";
    #print join('|', @tagmap), "\n";
    #print @tagmap, "\n";
    
    if (scalar keys %tagmap != 7) {
        next;
    }
    #@tagmap = sort keys %tagmap;
    if ($tagmap{"byr"} < 1920 or $tagmap{"byr"} > 2002) {
        print "byr-", join('|', %tagmap), "\n";
        next;
    }
    if ($tagmap{"iyr"} < 2010 or $tagmap{"iyr"} > 2020) {
        print "lyr-", join('|', %tagmap), "\n";
        next;
    }
    if ($tagmap{"eyr"} < 2020 or $tagmap{"eyr"} > 2030) {
        print "eyr-", join('|', %tagmap), "\n";
        next;
    }
    if ($tagmap{"hgt"} =~ /cm/) {
        if (((substr $tagmap{"hgt"}, 0, -2) < 150 or (substr $tagmap{"hgt"}, 0, -2) > 193)) {
            print "hgt-", join('|', %tagmap), "\n";
            next;
        }
    } elsif ($tagmap{"hgt"} =~ /in/) {
        if (((substr $tagmap{"hgt"}, 0, -2) < 59 or (substr $tagmap{"hgt"}, 0, -2) > 76)) {
            print "hgt-", join('|', %tagmap), "\n";
            next;
        }
    } else {
        next;
    }
    if (not ($tagmap{"hcl"} =~ /#[0-9a-f]{6}/)) {
        print "hcl-", join('|', %tagmap), "\n";
        next;
    }
    my %colors = ( "amb" => 1, "blu" => 1, "gry" => 1, "brn" => 1, "grn" => 1, "hzl" => 1, "oth" => 1 );
    if (not exists($colors{$tagmap{"ecl"}})) {
        print "ecl-", join('|', %tagmap), "\n";
        next;
    }
    if (not ($tagmap{"pid"} =~ /^[0-9]{9}$/)) {
        print "pid-", join('|', %tagmap), "\n";
        next;
    }
    print "good-", join ('|', map { $_ => $tagmap{$_} } sort keys %tagmap) , "\n";
# [ "hcl", "iyr" , .. ] 
# [ [ hcl, "amb" ] , ["iyr", "2020" ] ]
    $ctr += 1;
}
#print join("\n", @p), "\n" ;
print $ctr, "\n" ;

