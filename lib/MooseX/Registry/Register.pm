package MooseX::Registry;

use 5.006;

use strict;
use warnings;

use Moose::Role;

=head1 NAME

MooseX::Registry - Stay away from namespaces and class names with a Moose registry.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

$VERSION = eval $VERSION;

=head1 SYNOPSIS

Put your classes in the registry...

 package MyApp::Class::Name::v2_3;
 
 with MooseX::Registry::Role;
 
 __PACKAGE__->register( 'myclass-v2.3' );

Look them up later...

 with MooseX::Role::Registry;
  
 $class = $self->lookup( 'myclass-v2.3' );
 
 my $instance = $class->new;




=head1 METHODS

=head2 register

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Rob Brown, C<< <rob at intelcompute.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-role-registry at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-Role-Registry>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Role::Registry


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-Role-Registry>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-Role-Registry>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-Role-Registry>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-Role-Registry/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Rob Brown.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of MooseX::Role::Registry
