package PLTW;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  Mojo::IOLoop->next_tick(sub { srand });

  $self->moniker('PLTW');
  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');
  $self->plugin('Config');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  #$r->get('/')->to('example#welcome');
  #$r->get('/')->to('example#index');
  #$r->get('/:size', [size => qr/\d+/])->to('partners#list', size => '');
  $r->get('/')->to('partners#list');
  $r->get('/partners/:size', [size => qr/\d+/])->to('partners#list', size => '');
  $r->get('/roster')->to('roster#list');
  #$r->get('/books')->to('books#index');
  #$r->get('/communication')->to('communication#index');
  #$r->get('/resources')->to('resources#index');
  #$r->get('/articles')->to('articles#index');
}

1;
