DEBIAN_FRONTEND=noninteractive

# Clone Upstream
apt install -y rpm
wget https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Everything/x86_64/os/Packages/g/gnome-shell-extension-user-theme-44.0-1.fc38.noarch.rpm
mkdir -p ./gnome-shell-extension-user-theme
cp -rvf ./debian ./gnome-shell-extension-user-theme/
cd ./gnome-shell-extension-user-theme
rpm2cpio ../gnome-shell-extension-user-theme-44.0-1.fc38.noarch.rpm | cpio -idmv

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -pv ./output
mv -v ./*.deb ./output/
