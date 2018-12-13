use SDL2::Raw;
use SDL2::Ext;

class SnakeGame::Food {

  has SDL_Rect  $.rect = SDL_Rect.new(:x((20..480.rand).Int), :y((20..480.rand).Int), :w(7), :h(7));
  has SDL_Color $.color = SDL_Color.new(:r(255.rand.Int), :g(255.rand.Int), :b(255.rand.Int));


  method set-color (:$r, :$g, :$b) {
    $!color = SDL_Color.new(:$r, :$g, :$b);
	}

}
