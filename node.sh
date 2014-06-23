args=("$@")

version=${args[0]}
echo "install node version $version"
cwd=`pwd`
file="node-v$version"
tgzfile="$file.tar.gz"

wget http://nodejs.org/dist/v$version/$tgzfile

tar xf $tgzfile

cd $file

./configure --no-ssl2 --without-npm
make
cp out/Release/node /usr/local/bin/node

cd $cwd

rm -rf $file
rm $tgzfile
