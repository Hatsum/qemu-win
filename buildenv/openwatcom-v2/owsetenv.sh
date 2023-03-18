#!/bin/bash

export WATCOM=/opt/watcom
export EDPATH=$WATCOM/eddat
export INCLUDE=$WATCOM/h:$WATCOM/h/nt
# export LIB=
  
if [ "$MSYSTEM_CARCH" == "x86_64" ] ; then
  export PATH=$WATCOM/binnt64:$WATCOM/binnt:$WATCOM/binw:$PATH
  # export WHTMLHELP=$WATCOM/binnt/help
else
  export PATH=$WATCOM/binnt:$WATCOM/binw:$PATH
  # export WWINHELP=$WATCOM/binw
fi
