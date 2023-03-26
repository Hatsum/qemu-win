QEMU_SRC_DIR=../../../qemu-0
GIT=$(shell git rev-parse HEAD | sed "s/\(.......\).*/\1\-/")
TARGET=i686-pc-msdosdjgpp
CROSS=$(TARGET)-
CC=$(CROSS)gcc
CFLAGS=-I$(QEMU_SRC_DIR)/hw/3dfx -D__REV__=\"$(GIT)\" -Wall -Werror -O3 -fomit-frame-pointer -Wno-maybe-uninitialized
DXEGEN=$(CROSS)dxe3gen
DXE_LIB_PATH=$(shell dirname `which $(CC)`)/../$(TARGET)/lib
OUTDIR?=build

TARGET2=glide2x.dxe
TARGET3=glide3x.dxe

ifeq ($(V),1)
  DXEGENVERB=-V --verbose
else
  DXEGENVERB=
endif

all: $(TARGET2) $(TARGET3)

$(TARGET3): gl301dxe.o
	@echo "  CFLAGS $(CFLAGS)"
	@echo "  DXE $@"
	@echo "  DXE_LIB_PATH $(DXE_LIB_PATH)"
	@DXE_LD_LIBRARY_PATH=$(DXE_LIB_PATH) \
	    $(DXEGEN) $(DXEGENVERB) -o $@ -Y libfxgl3.a -E _gr -E _gu $+ -lc -Map glide3x.map
	@if [ -d ../$(OUTDIR) ]; then cp -v libfxgl3.a $(TARGET3) ../$(OUTDIR); fi

$(TARGET2): glidedxe.o
	@echo "  CFLAGS $(CFLAGS)"
	@echo "  DXE $@"
	@echo "  DXE_LIB_PATH $(DXE_LIB_PATH)"
	@DXE_LD_LIBRARY_PATH=$(DXE_LIB_PATH) \
	    $(DXEGEN) $(DXEGENVERB) -o $@ -Y libfxgl2.a -E _Convert -E _gr -E _gu $+ -lc -Map glide2x.map
	@if [ -d ../$(OUTDIR) ]; then cp -v libfxgl2.a $(TARGET2) ../$(OUTDIR); fi

%.o: %.c clib.h
	@echo "  CC  $@"
	@$(CC) -I../src $(CFLAGS) -c -o $@ $<

clean:
	@rm -f *.o *.a *.map $(TARGET2) $(TARGET3)

distclean: clean
	@rm -f ../$(OUTDIR)/*.dxe
