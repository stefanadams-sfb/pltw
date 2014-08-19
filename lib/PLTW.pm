package PLTW;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  $self->moniker('PLTW');
  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');
  $self->plugin('Config');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/partners/:size')->to('partners#list', size => 2);
  $r->get('/books')->to('books#index');
  $r->get('/communication')->to('communication#index');
  $r->get('/resources')->to('resources#index');
  $r->get('/articles')->to('articles#index');
}

1;
