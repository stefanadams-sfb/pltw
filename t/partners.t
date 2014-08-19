use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('PLTW');
$t->get_ok('/perldoc')->status_is(200);

done_testing();
