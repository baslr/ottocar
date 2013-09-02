archi=`uname -m`

if [ ! $archi = "x86_64" ]
then
  echo "use 64bits"
  exit 1
fi

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
  elif [ $machine = "Linux" ]
  then
    path=mongodb-linux-x86_64-$version
    wget http://fastdl.mongodb.org/linux/$path.tgz
  else
    echo "unsupported plattform :S"
    exit 1
  fi

  tar xf $path.tgz
  rm $path.tgz
  cp $path/bin/* /usr/local/bin/
  rm -rf $path

elif [ $software = "nodejs" ]
then
  if [ $machine = "Linux" ]
  then
    path=node-v$version-linux-x64
    wget http://nodejs.org/dist/v$version/$path.tar.gz
  fi
  
  tar xf $path.tar.gz
  rm $path.tar.gz
  cp $path/bin/node /usr/local/bin/
  rm -rf $path
fi

exit 0