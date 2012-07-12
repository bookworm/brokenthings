void map = new Gee.HashMap<Foo, Object>();

// With custom methods for hash generation
var map = new Gee.HashMap<Foo, Object>(foo_hash, foo_equal);