# Update msys2
pacman -Syuu --needed --noconfirm
# Restart msys2 and reexecute the command
pacman -Syuu --needed --noconfirm

# In MSYS environment
./scripts/msys-base.sh
./scripts/msys-build-env.sh

# In MINGW32 environment
./scripts/mingw-build-env.sh
./scripts/mingw-wrapper-dependencies.sh

# In MINGW64 environment
./scripts/mingw-qemu-dependencies.sh
./scripts/mingw-qemu-make.sh
./scripts/mingw-qemu-release.sh