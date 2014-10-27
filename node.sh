args=("$@")

version=${args[0]}
echo "install node version $version"
cwd=`pwd`
file="node-v$version"
tgzfile="$file.tar.gz"

wget https://nodejs.org/dist/v$version/$tgzfile

tar xf $tgzfile

cd $file

./configure --without-ssl2 --without-ssl3 --without-npm
make
cp out/Release/node /usr/local/bin/node

cd $cwd

rm -rf $file
rm $tgzfile
