#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'MooseX::Registry' ) || print "Bail out!\n";
}

diag( "Testing MooseX::Registry $MooseX::Registry::VERSION, Perl $], $^X" );
