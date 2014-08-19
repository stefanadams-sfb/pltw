package PLTW::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  my $xkcd = $self->config('xkcd');
  my %xkcd = %$xkcd;
  $xkcd = (keys %xkcd)[rand keys %xkcd];
  my $moral = $xkcd{$xkcd};
  $self->render_later;
  $self->ua->get("http://xkcd.com/$xkcd/info.0.json" => sub {
    my ($ua, $tx) = @_;
    $self->render(img => $tx->res->json->{img}, alt => $tx->res->json->{alt}, moral => $moral);
  });
}

1;
