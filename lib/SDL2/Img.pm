use SDL2::Raw;
use NativeCall;

sub IMG_Init(int32)             returns int32       is native<SDL2_image> is export { * }
sub IMG_Load(Str)               returns SDL_Surface is native<SDL2_image> is export { * }
sub IMG_Load_RW(Pointer, int32) returns SDL_Surface is native<SDL2_image> is export { * }
sub IMG_isBMP(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isCUR(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isICO(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isGIF(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isJPG(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isLBM(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isPCX(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isPNG(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isPNM(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isTIF(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isXCF(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isXPM(Pointer)          returns int32       is native<SDL2_image> is export { * }
sub IMG_isXV(Pointer)           returns int32       is native<SDL2_image> is export { * }
sub IMG_GetError()              returns Str         is native<SDL2_image> is export { * }
