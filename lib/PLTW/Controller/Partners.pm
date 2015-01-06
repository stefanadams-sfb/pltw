package PLTW::Controller::Partners;
use Mojo::Base 'Mojolicious::Controller';

use Mojo::Redis2;

my $redis = Mojo::Redis2->new;

sub list {
  my $self = shift;
  my $xkcd = $self->config('xkcd');
  my %xkcd = %$xkcd;
  $xkcd = (keys %xkcd)[rand keys %xkcd];
  my $moral = $xkcd{$xkcd};
  $self->render_later;
  $self->ua->get("http://xkcd.com/$xkcd/info.0.json" => sub {
    my ($ua, $tx) = @_;
    $self->render(redis => $redis, img => $tx->res->json->{img}, alt => $tx->res->json->{alt}, moral => $moral);
  });
}

1;
