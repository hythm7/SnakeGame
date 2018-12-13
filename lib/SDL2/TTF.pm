use SDL2::Raw;
use SDL2::Ext;
use NativeCall;

class TTF_Font is repr<CStruct> is export { # typedef struct SDL_Color {
	has uint32 $!c;
  #has SDL_Color $.color;

}                                            # } SDL_Color;
#constant TTF_Font = TTF_Font;             #define SDL_Colour SDL_Color

enum TTF is export (
    TTF_HINTING_NORMAL      => 0,
    TTF_HINTING_LIGHT       => 1,
    TTF_HINTING_MONO        => 2,
    TTF_HINTING_NONE        => 3,
    TTF_STYLE_NORMAL        => 0,
    TTF_STYLE_BOLD          => 1,
    TTF_STYLE_ITALIC        => 2,
    TTF_STYLE_UNDERLINE     => 4,
    TTF_STYLE_STRIKETHROUGH => 8,
); # SDL::TTF

sub TTF_Init()                                  returns int32       is native<SDL2_ttf> is export { * }
sub TTF_OpenFont(Str $file,int32)   returns TTF_Font            is native<SDL2_ttf> is export { * }

sub TTF_SetFontStyle(TTF_Font,int32)   returns TTF_Font is native<SDL2_ttf> is export { * }
sub TTF_SetFontOutline(TTF_Font,int32) returns TTF_Font is native<SDL2_ttf> is export { * }
sub TTF_SetFontHinting(TTF_Font,int32) returns TTF_Font is native<SDL2_ttf> is export { * }

sub TTF_RenderText_Shaded(TTF_Font,Str, SDL_Color, SDL_Color) returns SDL_Surface is native<SDL2_ttf> is export { * }
