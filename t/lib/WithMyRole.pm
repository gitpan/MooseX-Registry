package WithMyRole;

use Moose;

with 'MyRole';

__PACKAGE__->register('role-object');

1;
