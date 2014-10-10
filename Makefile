all: lister

lister: buc-lister.o
	clang -dynamiclib  -O1 -DNDEBUG -Wl,-rpath,/Users/alini/notes/rakudo/install/lib -lpthread -lkyotocabinet -o buc-lister.dylib buc-lister.o

buc-lister.o: buc-lister.c
	clang -c  -o buc-lister.o -fno-omit-frame-pointer -fno-optimize-sibling-calls -O1 -DNDEBUG  -D_DARWIN_USE_64_BIT_INODE=1  buc-lister.c

clean:
	rm -rf *o *dylib

install: BucharestLister.pm6 buc-lister.dylib
	cp BucharestLister.pm6 /Users/alini/notes/rakudo/install/languages/perl6/lib/BucharestLister.pm6
	cp buc-lister.dylib /Users/alini/notes/rakudo/install/languages/perl6/lib/buc-lister.dylib

uninstall:
	rm -f /Users/alini/notes/rakudo/install/languages/perl6/lib/BucharestLister.pm6
	rm -f /Users/alini/notes/rakudo/install/languages/perl6/lib/buc-lister.dylib

