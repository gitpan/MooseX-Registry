use strict;
use warnings;

use Test::More;
use Test::Exception;

use MooseX::Registry;

use lib 't/lib';

use Basic;
use WithMyRole;
use MyRegistry;

my $instance;

lives_ok { $instance = MooseX::Registry->instance } "instantiated ok";

ok( MooseX::Registry->lookup( 'basic-object' ) eq 'Basic', "'basic-object' => 'Basic'" );


ok( ! defined MooseX::Registry->lookup( 'role-object' ), "not able to lookup namespaced label" );


ok( MyRegistry->lookup( 'role-object' ) eq 'WithMyRole', "'role-object' => 'WithMyRole'" );


done_testing();


