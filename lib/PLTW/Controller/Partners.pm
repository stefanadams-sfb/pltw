package PLTW::Controller::Partners;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Redis2;

my $redis = Mojo::Redis2->new;

sub list { shift->render(redis => $redis) }

1;
