use NativeCall;

sub create_db(Str) is native('./buc-lister') is symbol('create_db') { * }

sub open(Str $name) {
	create_db("$name.kch");
}

open("alin");
