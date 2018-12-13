#!/usr/bin/env perl6

use lib <lib>;

use SDL2::Ext;

use SnakeGame;


my $background = SDL_Color.new(:r(7), :g(7), :b(7));
my $snakecolor = SDL_Color.new(:r(77), :g(155), :b(77));

my $game = SnakeGame.new(:$background, :$snakecolor);

$game.start();
$game.end();
