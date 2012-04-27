package MyRole;

use Moose::Role;

with 'MooseX::Registry::Role' => {
	-alias    => { register => 'core_register', lookup => 'core_lookup' },
	-excludes => [ 'register', 'lookup' ]
};

sub register
{
	my $class = shift;
	my $key = shift;
    
	__PACKAGE__->core_register( $key => $class );
}

sub lookup
{
	my $class = shift;
	my $key = shift;
    
	__PACKAGE__->core_lookup( $key );
}

1;

