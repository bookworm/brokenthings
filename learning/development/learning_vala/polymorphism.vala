class SuperClass : GLib.Object {
  public void method_1() {
    stdout.printf("SuperClass.method_l()\n");
  }
}

class SubClass : SuperClass {
  public void method_1() {
    stdout.printf("SubClass method_1()\n");
  }
}

SubClass o1 = new SubClass();
o1.method_1();
SuperClass o2 = o1;
o2.method_1();

class SuperClass : GLib.Object {
  public virtual void method_1() {
    stdout.printf("SuperClass.method_1()\n");
  }
}

class SubClass : SuperClass {
  public overrirde void method_1() {
    stdout.printf("SubClasse.mehtod_1()\n");
  }
}

public overrirde void method_name() {
  base.method_name();
  extra_task();
}

class Foo : Object {
  public void my_method() {}
}

class Bar : Foo {
  public new void my_method() {}
}

void main() {
  var bar = new Bar();
  bar.my_method();
  (bar as Foo).my_method();
}

bool b = object is SomeTypeName;

Type type = object.get_type();
stdout.printf("%s\n", type.name());

Type type = typeof(Foo);
Foo foo = (Foo) Object.new(type);

Button b = widget as Button;

Button b = (widget is Button) ? (Button) widget : null;

