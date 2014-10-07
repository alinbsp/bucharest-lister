all: lister

lister: buc-lister.o
	clang -dynamiclib  -O1 -DNDEBUG -Wl,-rpath,/Users/alini/notes/rakudo/install/lib -lpthread -lkyotocabinet -o buc-lister.dylib buc-lister.o

buc-lister.o: buc-lister.c
	clang -c  -o buc-lister.o -fno-omit-frame-pointer -fno-optimize-sibling-calls -O1 -DNDEBUG  -D_DARWIN_USE_64_BIT_INODE=1  buc-lister.c

clean:
	rm -rf *o *dylib

