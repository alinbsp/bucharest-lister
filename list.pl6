use BucharestLister;


my $db = Db.new( name => "noper" );

$db.set("Alin", "Boom");

my $res = $db.get("Alin");
say $res;
# vi: filetype=perl6: 
