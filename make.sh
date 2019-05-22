#!/bin/bash

set -e

if [ -d /Applications/Xcode-5.1.1.app ]; then
  sudo xcode-select --switch /Applications/Xcode-5.1.1.app
fi

if which xcrun &>/dev/null; then
    flags=(xcrun -sdk macosx g++)
    flags+=(-mmacosx-version-min=10.4)

    for arch in i386 x86_64; do
        flags+=(-arch "${arch}")
    done
else
    flags=(g++)
fi

flags+=(-I.)

set -x
"${flags[@]}" -c -std=c++11 -o ldid.o ldid.cpp
"${flags[@]}" -o ldid ldid.o -x c lookup2.c -x c sha1.c

"${flags[@]}" -c -std=c++11 -o ldid2.o ldid2.cpp
"${flags[@]}" -o ldid2 ldid2.o -x c lookup2.c -x c sha1.c -x c sha224-256.c

   37  g++ -std=c++11 -o ldid2.o ldid2.cpp
   38  g++ -I.  -std=c++11 -o ldid2.o ldid2.cpp
   40  g++ -I.  -std=c++11 -o ldid2.o ldid2.cpp sha1.c sha224-256.c
   42  g++ -I. -c  -std=c++11 -o ldid2.o ldid2.cpp
   43  g++ -o ldid2 ldid2.o -x c lookup2.c -x c sha1.c -x c sha224-256.c

sh make.sh
+ xcrun -sdk macosx g++ -stdlib=libc++ -mmacosx-version-min=10.9 -arch x86_64 -I. -c -std=c++11 -o ldid.o ldid.cpp
+ xcrun -sdk macosx g++ -stdlib=libc++ -mmacosx-version-min=10.9 -arch x86_64 -I. -o ldid ldid.o -x c lookup2.c -x c sha1.c
+ xcrun -sdk macosx g++ -stdlib=libc++ -mmacosx-version-min=10.9 -arch x86_64 -I. -c -std=c++11 -o ldid2.o ldid2.cpp
+ xcrun -sdk macosx g++ -stdlib=libc++ -mmacosx-version-min=10.9 -arch x86_64 -I. -o ldid2 ldid2.o -x c lookup2.c -x c sha1.c -x c sha224-256.c
i9-2:ldid-master yarshure$ 
