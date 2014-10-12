module BucharestLister;

use NativeCall;

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

class Db is export {
  has $!handler;

  # method new() {
  # 	create_db("$.handler.kch");
  # }
  submethod BUILD(:$!handler) { 
    create_db("$!handler.kch");
  }

  method set(Str $key, Str $value) {
  	store_db($.handler, $key, $value);
  }

  method get(Str $key) {
  	return get_db($.handler, $key);
  }
}

# vi: filetype=perl6: 
