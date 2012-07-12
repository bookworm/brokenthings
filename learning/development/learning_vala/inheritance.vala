class SuperClass : GLib.Object {
  private int data;

  public SuperClass(int data) {
    this.data = data;
  }

  protected void protected_method() {}

  public static void public_static_method() {}
}

class SubClass : SuperClass {
  public SubClass() {
    base(10);
  }
}

public abstract class Animal : Object {
  public void eat() {
    stdout.printf("eating");
  }

  public abstract void say_hello();
}

public class Tiger : Animal {
  public override void say_hello() {
    stdout.printf("I'm a fucking talking tiger");
  }
}

public class Duck : Animal {
  public override void say_hello() {
    stdout.printf("please dont eat me");
  }
}

public interface ITest : GLib.Object {
  public abstract int data_l { get; set; }
  public abstract void method_l();
}

public class Test1 : GLib.Object, ITest {
  public int data_l { get; set; }
  public void method_l() {}
}

var t = new Test1();
t.method_l();

ITest i = t;
i.method_l();

public interface List : Collection {
}

public class ListClass : GLib.Object, Collection, List {

}

