use NativeCall;
use SDL2::Raw;

class SDL_Color is repr<CStruct> is export { # typedef struct SDL_Color {
    has uint8 $.r;                           #     Uint8 r;
    has uint8 $.g;                           #     Uint8 g;
    has uint8 $.b;                           #     Uint8 b;
    has uint8 $.a = 255;                     #     Uint8 unused;
}                                            # } SDL_Color;
constant SDL_Colour = SDL_Color;             #define SDL_Colour SDL_Color


class SDL_Palette is repr<CStruct> is export {  # typedef struct SDL_Palette {
    has              int32 $.ncolors;           #     int       ncolors;
    has Pointer[SDL_Color] $.colors;            #     SDL_Color *colors;
}                                               # } SDL_Palette;

#~ /** Everything in the pixel format structure is read-only */
class SDL_PixelFormat is repr<CStruct> is export { # typedef struct SDL_PixelFormat {
    has SDL_Palette $.palette;                     #      SDL_Palette *palette;
    has       uint8 $.BitsPerPixel;                #      Uint8  BitsPerPixel;
    has       uint8 $.BytesPerPixel;               #      Uint8  BytesPerPixel;
    has       uint8 $.Rloss;                       #      Uint8  Rloss;
    has       uint8 $.Gloss;                       #      Uint8  Gloss;
    has       uint8 $.Bloss;                       #      Uint8  Bloss;
    has       uint8 $.Aloss;                       #      Uint8  Aloss;
    has       uint8 $.Rshift;                      #      Uint8  Rshift;
    has       uint8 $.Gshift;                      #      Uint8  Gshift;
    has       uint8 $.Bshift;                      #      Uint8  Bshift;
    has       uint8 $.Ashift;                      #      Uint8  Ashift;
    has      uint32 $.Rmask;                       #      Uint32 Rmask;
    has      uint32 $.Gmask;                       #      Uint32 Gmask;
    has      uint32 $.Bmask;                       #      Uint32 Bmask;
    has      uint32 $.Amask;                       #      Uint32 Amask;
                                                   #      /** RGB color key information */
    has      uint32 $.colorkey;                    #      Uint32 colorkey;
                                                   #      /** Alpha value information (per-surface alpha) */
    has       uint8 $.alpha;                       #      Uint8  alpha;
}                                                  # } SDL_PixelFormat;

sub SDL_Delay(int32)                      is native<SDL2> is export {*}
sub SDL_FreeSurface(SDL_Surface $surface) is native<SDL2> is export {*}
sub SDL_IntersectRect(SDL_Rect, SDL_Rect, SDL_Rect) is native<SDL2> is export {*}
sub SDL_HasIntersection(SDL_Rect, SDL_Rect --> Bool) is native<SDL2> is export {*}
#sub SDL_RenderDrawPoints(SDL_Renderer, CArray[int32], int32) is native<SDL2> is export {*};
