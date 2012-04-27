package MooseX::Registry::Role;

use 5.006;

use strict;
use warnings;

use Moose::Role;

=head1 NAME

MooseX::Registry::Role - The role for MooseX::Registry.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

$VERSION = eval $VERSION;

=head1 SYNOPSIS

 package Long::Name::I::Want::To::Change::Later;
 
 with MooseX::Registry::Role;
 
 __PACKAGE__->register( 'nice-name-v2');
 
 1;

 use MooseX::Registry;
  
 $class = MooseX::Registry->lookup( 'nice-name-v2' );
 
 my $instance = $class->new;

=head1 METHODS

=head2 register

Adds an entry in the registry for this class name with a label.

=cut

sub register
{
	if ( scalar @_ == 2 )
	{
		# no namespace
		
		my $class     = shift;
		my $key       = shift;

		MooseX::Registry->instance->_hash->{ $key } = $class;
	}
	else
	{
		my $namespace = shift;
		my $key       = shift;
		my $class     = shift;

		my $hash = MooseX::Registry->instance->_hash;
	
		$hash->{ $namespace } = {} unless exists $hash->{ $namespace };
	
		$hash->{ $namespace }->{ $key } = $class;
	}
}

=head2 lookup

Looks up a label to find the original class name.

=cut

sub lookup
{
	my $namespace = shift;
	my $key       = shift;

	my $hash = MooseX::Registry->instance->_hash;

	return $hash->{ $namespace }->{ $key } if exists $hash->{ $namespace } && ref $hash->{ $namespace } eq 'HASH' && exists $hash->{ $namespace }->{ $key };
	
	return $hash->{ $key } if exists $hash->{ $key };
	
	return undef;
}

=head1 AUTHOR

Rob Brown, C<< <rob at intelcompute.com> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Rob Brown.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1;

