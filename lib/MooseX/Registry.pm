package MooseX::Registry;

use 5.006;

use strict;
use warnings;

use MooseX::Singleton;

with 'MooseX::Registry::Role';

=head1 NAME

MooseX::Registry - Hide namespaces and class names with a Moose registry.

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

$VERSION = eval $VERSION;

has _hash => ( is      => 'rw',
               isa     => 'HashRef',
               default => sub { {} },
             );

=head1 SYNOPSIS

Put your classes in the registry...

 package Long::Name::I::Want::To::Change::Later;
 
 with MooseX::Registry::Role;
 
 __PACKAGE__->register( 'nice-name-v2');
 
 1;

Look them up later...

 use MooseX::Registry;
  
 $class = MooseX::Registry->lookup( 'nice-name-v2' );
 
 my $instance = $class->new;

=head1 DESCRIPTION

If you have to deal with collisions, you can extend the role to introduce namespacing separation by usinmg your own role...

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

Now consume your own role.  The important bit is the call to C<core_register>.

You can C<alias> the original methods however you choose, and also name your own C<register> and C<lookup> methods inline with your own project.
         
=head1 AUTHOR

Rob Brown, C<< <rob at intelcompute.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-role-registry at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-Registry>.  I will be notified, and then you will
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Registry


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-Registry>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-Registry>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-Registry>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-Registry/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Rob Brown.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;

