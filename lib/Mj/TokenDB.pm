=head1 NAME

Mj::TokenDB.pm - A database for maintaining info about confirmation tokens

=head1 DESCRIPTION

This is a simple database holding the tokens.  The key is the token itself.
The fields are:

type       - the type of the token; confirm or consult.
list       - the list the request will be performed in, if any.
request    - the request to be performed.  A '_' will be prepended and
             used as the function to call when the token is approved.
requester  - the address that made the request
victim     - the address that will be affected by the request (if any)
mode       - the mode that the command will be run with
cmdline    - the command that was issued (depends on the interface, used
             for user feedback)
approvals  - the number of approvals still required
chain1     - used to chain confirmation and consultation.  The first
chain2     - contains the approval count, the second, the filename.
chain3
chain4
arg1-3     - the remaining arguments for the core function
time       - the time the request was made
changetime - updated with each change

=head1 SYNOPSIS

See Mj::SimpleDB.

=cut
package Mj::TokenDB;
use strict;
use Mj::SimpleDB;
use vars qw(@ISA);
@ISA=qw(Mj::SimpleDB);

my @fields = qw(type list request requester victim mode cmdline approvals
		chain1 chain2 chain3 chain4 arg1 arg2 arg3 time
		changetime sessionid reminded permanent expire remind);

=head2 new(path)

This allocates a TokenDB by making a SimpleDB object with the fields we
use.

=cut
sub new {
  my $type  = shift;
  my $class = ref($type) || $type;
 
  my $path   = shift;
 
  my $self = new Mj::SimpleDB $path, \@fields;
  bless $self, $class;
}

=head1 COPYRIGHT

Copyright (c) 1997, 1998 Jason Tibbitts for The Majordomo Development
Group.  All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of the license detailed in the LICENSE file of the
Majordomo2 distribution.

his program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the Majordomo2 LICENSE file for more
detailed information.

=cut

1;
#
### Local Variables: ***
### cperl-indent-level:2 ***
### cperl-label-offset:-1 ***
### End: ***
