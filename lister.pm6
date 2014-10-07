use NativeCall;

sub create_db(Str) is native('./buc-lister') is symbol('open_db') { * }

sub open(Str $name) {
	create_db("$name.kch");
}
