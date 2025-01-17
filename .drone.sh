apt-get update
apt-get -y install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python libtinfo5 libncurses5  2>&1 | tail -100
mkdir -p ~/bin
mkdir -p ~/android/lineage
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
cd ~/android/lineage
~/bin/repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth=1
~/bin/repo sync -c -j 16  2>&1 | tail -300
mkdir -p ~/android/lineage/.repo/local_manifests/
curl https://raw.githubusercontent.com/vm03/android_device_yandex_Amber/lineage-16.0-ota-drone/test_manifest.xml >  ~/android/lineage/.repo/local_manifests/test.xml
~/bin/repo sync -c -j 16  2>&1 | tail -100
source build/envsetup.sh
lunch lineage_Amber-userdebug 2>&1 | tail -300
mka bootimage 2>&1 | tail -300
curl -T out/target/product/Amber/boot.img --user "$YAUSER:$YAPASS" https://webdav.yandex.ru/boot-`date +%Y%m%d`.img

