unit class SnakeGame::Window;

use SDL2::Raw;

has $.window;

method new(
  Str :$title    = "Snake!",
  int32 :$x      = SDL_WINDOWPOS_CENTERED_MASK,
  int32 :$y      = SDL_WINDOWPOS_CENTERED_MASK,
  int32 :$width  = 800,
  int32 :$height = 600,
  int32 :$flags) {

  my $window = SDL_CreateWindow($title, $x, $y, $width, $height, $flags);
  return self.bless(:window($window));
}

method title(Str $title) {
  SDL_SetWindowTitle($!window, $title)
}

method destroy {
  SDL_DestroyWindow($!window) if $!window.defined;
}

