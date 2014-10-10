module BucharestLister;

use NativeCall;

my $handler;

sub create_db(Str) 
	returns OpaquePointer
	is native('./buc-lister') 
	is symbol('open_db') { * }

sub store_db(OpaquePointer, Str, Str)
	is native('./buc-lister')
	is symbol('store_db') { * }

sub get_db(OpaquePointer, Str)
	returns Str
	is native('./buc-lister')
	is symbol('retrieve_db') { * }

sub open(Str $name) is export {
	$handler = create_db("$name.kch");
}

sub set(Str $key, Str $value) is export {
	store_db($handler, $key, $value);
}

sub get(Str $key) is export {
	return get_db($handler, $key);
}
