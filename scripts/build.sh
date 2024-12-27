set -xe

clear

PKG_RPM="pkg-rpm"
PKG="my_app"
ARCH="x86_64"
REL=${CI_PIPELINE_IID}


if [ $REL ==  ]; then REL="112"; fi;

PREF=-dev
if [ "$CI_COMMIT_BRANCH" = "master" ]; then PREF=""; fi;
echo $REL

cd ..

rpmdev-setuptree

mkdir -p ~/RPM/BUILD/$PKG
cp -r $PKG/* ~/RPM/BUILD/$PKG/
cp  $PKG/scripts/$PKG.spec ~/RPM/SPECS

rpmbuild  -bb --define "rel ${REL}" --define "pref ${PREF}" ~/RPM/SPECS/$PKG.spec