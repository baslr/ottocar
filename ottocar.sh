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

if [ $machine = "Darwin" ]
then
	echo "System OS X"
	if [ $software = "mongodb" ]
	then
		path=mongodb-osx-x86_64-$version
		wget http://fastdl.mongodb.org/osx/$path.tgz
		tar xf $path.tgz
		rm $path.tgz
		cp $path/bin/* /usr/bin/
		rm -rf $path
	fi
elif [ $machine = "Linux" ]
then
	echo "System Linux"
	if [ $software = "mongodb" ]
	then
                path=mongodb-linux-x86_64-$version
                wget http://fastdl.mongodb.org/linux/$path.tgz
                tar xf $path.tgz
                rm $path.tgz
                cp $path/bin/* /usr/bin/
                rm -rf $path
	fi
fi
