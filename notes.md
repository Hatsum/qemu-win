# Update msys2
pacman -Syuu --needed --noconfirm
# restart
pacman -Syuu --needed --noconfirm
# install dependencies
./scripts/msys2-base.sh
./scripts/msys2-qemu-dependencies.sh
pacman -Scc --needed --noconfirm

# Docker (don't work currently, see https://github.com/msys2/msys2-runtime/issues/59)
# Inspire by https://hub.docker.com/r/amitie10g/msys2
docker build -t hatsum/msys2 -f docker\msys2\dockerfile .

docker build -t hatsum/msys2-qemu -f docker\msys2-qemu\dockerfile .

docker run --rm -it -e MSYSTEM=MINGW64 -v ${pwd}:C:\Users\ContainerUser\qemu-win -w C:\Users\ContainerUser\qemu-win hatsum/msys2-qemu:latest