public class Person : Object {
  public string name { get; construct; }
  public int age { get; construct set;}

  public Person(string name) {
    Object(name: name);
  }

  public Person.with_age(string name, int years) {
    Object(name: name, age: years);
  }

  construct {
    stdout.printf("Welcome %s\n", this.name);
  }
}

double method_name(int x, double d)
  requires (x > 0 && x < 10)
  requires (d >= 0.0 && d <= 1.0)
  ensures (result >= 0.0 && result <= 10.0)
{
  return d * x;
}

void my_method() throws IOError {
}

if(something_went_wrong) {
  throw new IOError.FILE_NOT_FOUND("Requested file could not be found.");
}

try {
  my_method();
} catch (IOError e) {
  stdout.printf("Error: %s\n", e.message);
}

IOChannel channel;
try {
  channel = new IOChannel.file("/tmp/my_lock", "w");
} catch(FileError e) {
  if(e is FileError.EXIST) {
    throw e;
  }

  GLib.error("", e.message);
}

public errordomain IOError {
  FILE_NOT_FOUND
}

void main() {
  var loop = new MainLoop();
  var time = new TimeoutSource();

  time.set_callback(() => {
    stdout.printf("Time!\n");
    loop.quit();
    return false;
  });

  time.attach(loop.get_context());

  loop.run();
}

void main(string[] args) {
  Gtk.init(ref args);
  var time = new TimeoutSource(2000);

  time.set_callback(() => {
    stdout.printf("Time!\n");
    Gtk.main_quit();
    return false;
  });

  time.attach(null);

  Gtk.main();
}