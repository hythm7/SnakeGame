use nqp;
use SDL2::Raw;
use SDL2::Ext;

use SnakeGame::Window;
use SnakeGame::Renderer;
use SnakeGame::Snake;
use SnakeGame::Food;

constant W = 700;
constant H = 700;

class SnakeGame {
  has Int $.level = 10;
  has Int $.width;
  has Int $.height;
	has SDL_Rect @!borders;

	has SDL_Color $.background;
	has SDL_Color $.snakecolor;

	has $!renderer;
	has $!window;

	has SnakeGame::Food  @!food;
	has SnakeGame::Snake $!snake;

  submethod BUILD (
	  :$!width  = W;
	  :$!height = H;

	  :$!background = SDL_Color.new(:r(0), :g(0), :b(0));
	  :$!snakecolor = SDL_Color.new(:r(0), :g(155), :b(0));
		) {

    SDL_Init(VIDEO);

		$!window    = SnakeGame::Window.new(:$!width, :$!height, :flags(SHOWN)); 
    $!renderer  = SnakeGame::Renderer.new($!window, :flags(ACCELERATED));

    my $left-border   = SDL_Rect.new(:x(0),     :y(0),     :w(7), :h(H));
    my $right-border  = SDL_Rect.new(:x(W - 7), :y(0),     :w(7), :h(H));
    my $top-border    = SDL_Rect.new(:x(0),     :y(0),     :w(W), :h(7));
    my $bottom-border = SDL_Rect.new(:x(0),     :y(H - 7), :w(W), :h(7));

		@!borders = $left-border, $top-border, $right-border, $bottom-border;


		$!snake = SnakeGame::Snake.new();
		@!food.push: SnakeGame::Food.new() for ^4;
		say @!food;
  }

  enum GAMEKEYS (
    K_UP    => 82,
    K_DOWN  => 81,
    K_LEFT  => 80,
    K_RIGHT => 79,
  );

	method start () {

	  my $snakedir = RIGHT;

	  my $event = SDL_Event.new;

		my $fps  = $!level;
		my $mspf;

		main: loop {

		  my num $start = nqp::time_n();

			while SDL_PollEvent($event) {
				my $casted-event = SDL_CastEvent($event);
				last main if $casted-event.type ~~ QUIT;
				if $casted-event.type ~~ KEYDOWN {
          $snakedir = LEFT  if $casted-event.scancode == +LEFT;
          $snakedir = RIGHT if $casted-event.scancode == +RIGHT;
          $snakedir = DOWN  if $casted-event.scancode == +DOWN;
          $snakedir = UP    if $casted-event.scancode == +UP;
				}

			}

			next main if $!level ~~ 0;

      self.update(:$snakedir);
		  self.render();

		  $mspf = 1000 / $fps - $!level;
		  SDL_Delay(($start + $mspf - nqp::time_n()).Int);
		}

	}

	method !init-game () {
    
	}



  method update (:$snakedir) {
	  
    $!snake.move(:$snakedir);

    for @!food -> $food {
			if SDL_HasIntersection($!snake.head.rect, $food.rect) {
				$!snake.nom(:$food);
			  @!food .= grep: * ne $food;
			}
		}

		$!level += 1 if $!snake.length %% 7;
	  
		for @!borders -> $border {
			if SDL_HasIntersection($!snake.head.rect, $border) {
			  $!level = 0;
			}
		}
	  
	}

  method render () {
	  self!render-bg();
	  self!render-food();
	  self!render-snake();

		#$!renderer.draw-color($!snake.color.r, $!snake.color.g, $!snake.color.b, $!snake.color.a);


		$!renderer.present;

	}

	method !render-bg () {

		$!renderer.draw-color($!background.r, $!background.g, $!background.b, $!background.a);
		$!renderer.clear;

 		$!renderer.draw-color(77,77,77, 77); # Border color;
		$!renderer.fill-rect($_) for @!borders;;


		

	}

	method !render-food () {
	  for @!food -> $food {
			$!renderer.draw-color((0...255).pick, (0...255).pick , (0...255).pick , (0...255).pick);
			$!renderer.fill-rect($food.rect);
		}
	}

	method !render-snake () {
		loop (my $p = $!snake.head; $p; $p .= prev) {
			$!renderer.draw-color($p.color.r, $p.color.g, $p.color.b, $p.color.a);
			$!renderer.fill-rect($p.rect);
		}
	}

  method !end () {
    $!renderer.destroy;
    $!window.destroy;
	}

}



