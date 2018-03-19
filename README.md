mc sources with some specific patches
======

![mc](https://raw.githubusercontent.com/zlaxy/mc/master/mc.png)

**applied patches:**
01-to-git/02-scrollbar.patch - Scrollbar in active panel
04-ose/99-02-f3-dirsize.patch - F3 shows dirsize
04-ose/99-12-selmnt.patch - Shift+F1/F2 Mountpoints menu
04-ose/99-16-mc.charsets.patch - only russian charsets
**additional files:**
ose-mc-4.8.19-patches.tbz - mc patches pack by ose ( https://www.linux.org.ru/forum/midnight/13373610 )
config_samples/ - samples of Mountpoints menu

### Installation:

**1. Install build dependencies.**
debian based:
```
sudo apt-get build-dep mc
```
redhat based:
```
sudo dnf builddep mc
```
**2. Configure:**
```
./autogen.sh
./configure --enable-vfs-smb --enable-charset
```
**3. Compile and install:**
```
make
sudo make install
```