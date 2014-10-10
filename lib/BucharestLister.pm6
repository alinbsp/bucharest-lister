use NativeCall;

module BucharestLister;

sub create_db(Str) 
	returns OpaquePointer
	is native('./buc-lister') 
	is symbol('open_db') { * }

sub open(Str $name) is export {
	create_db("$name.kch");
} 
