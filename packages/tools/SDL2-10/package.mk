PKG_NAME="SDL2-10"
PKG_VERSION="2.0.10"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libsdl.org/"
PKG_URL="https://www.libsdl.org/release/SDL2-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib systemd dbus $OPENGLES pulseaudio"
PKG_LONGDESC="Simple DirectMedia Layer is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware."

if [ ${PROJECT} = "Amlogic-ng" ] || [ ${PROJECT} = "Amlogic" ]; then
  PKG_PATCH_DIRS="Amlogic"
fi

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libdrm mali-bifrost librga"

pre_configure_target(){
  PKG_CMAKE_OPTS_TARGET="-DSDL_STATIC=OFF \
                         -DLIBC=ON \
                         -DGCC_ATOMICS=ON \
                         -DALTIVEC=OFF \
                         -DOSS=OFF \
                         -DALSA=ON \
                         -DALSA_SHARED=ON \
                         -DJACK=OFF \
                         -DJACK_SHARED=OFF \
                         -DESD=OFF \
                         -DESD_SHARED=OFF \
                         -DARTS=OFF \
                         -DARTS_SHARED=OFF \
                         -DNAS=OFF \
                         -DNAS_SHARED=OFF \
                         -DLIBSAMPLERATE=OFF \
                         -DLIBSAMPLERATE_SHARED=OFF \
                         -DSNDIO=OFF \
                         -DDISKAUDIO=OFF \
                         -DDUMMYAUDIO=OFF \
                         -DVIDEO_WAYLAND=OFF \
                         -DVIDEO_WAYLAND_QT_TOUCH=ON \
                         -DWAYLAND_SHARED=OFF \
                         -DVIDEO_MIR=OFF \
                         -DMIR_SHARED=OFF \
                         -DVIDEO_COCOA=OFF \
                         -DVIDEO_DIRECTFB=OFF \
                         -DVIDEO_VIVANTE=OFF \
                         -DDIRECTFB_SHARED=OFF \
                         -DFUSIONSOUND=OFF \
                         -DFUSIONSOUND_SHARED=OFF \
                         -DVIDEO_DUMMY=OFF \
                         -DINPUT_TSLIB=OFF \
                         -DPTHREADS=ON \
                         -DPTHREADS_SEM=ON \
                         -DDIRECTX=OFF \
                         -DSDL_DLOPEN=ON \
                         -DCLOCK_GETTIME=OFF \
                         -DRPATH=OFF \
                         -DRENDER_D3D=OFF \
                         -DVIDEO_X11=OFF \
                         -DVIDEO_OPENGLES=ON \
                         -DVIDEO_VULKAN=OFF \
                         -DVIDEO_KMSDRM=ON \
                         -DPULSEAUDIO=ON"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp libSDL2-2.0.so.0.10.0 $INSTALL//usr/lib
}
