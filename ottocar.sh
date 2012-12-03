mongoUrl=http://fastdl.mongodb.org/osx/mongodb-osx-x86_64-
nodeUrl=http://nodejs.org/dist/v0.8.15/node-v0.8.15-linux-x64.tar.gz
args=("$@")
if [ ${args[0]} ]
then
	software=${args[0]}
else
	echo "bitte software angeben"
	exit 1
fi
if [ ${args[1]} ]
then
	version=${args[1]}
else
	echo "bitte version angeben"
	exit 1
fi

if [ $software = "nodejs" ]
then
	echo "SELECTED: nodejs"

elif [ $software = "mongodb" ]
then
	echo "SELECTED: mongodb"
else
	echo "kenne $software nicht."
	exit 1
fi

machine=`uname`

if [ $software = "mongodb" ]
then
  if [ $machine = "Darwin" ]
  then 
    path=mongodb-osx-x86_64-$version
		wget http://fastdl.mongodb.org/osx/$path.tgz
  elfi [ $machine = "Linux" ]
    path=mongodb-linux-x86_64-$version
    wget http://fastdl.mongodb.org/linux/$path.tgz
  else
    echo "unsupported plattform :S"
    exit 1
  fi
  
	tar xf $path.tgz
	rm $path.tgz
	cp $path/bin/* /usr/bin/
	rm -rf $path
fi
