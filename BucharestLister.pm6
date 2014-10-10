module BucharestLister;

use NativeCall;

my $handler;

sub create_db(Str) 
	returns OpaquePointer
	is native('./buc-lister') 
	is symbol('open_db') { * }

sub store_db(OpaquePointer, Str, Str)
	returns Int
	is native('./buc-lister')
	is symbol('store_db') { * }

sub open(Str $name) is export {
	$handler = create_db("$name.kch");
}

sub store(Str $key, Str $value) is export {
	my $res = store_db($handler, $key, $value);
}
