public class TestClass : GLib.Object 
{ 
  public int first_data = 0;
  private int second_data;

  public TestClass()
  {
    this.second_data = 5;
  }

  public int getSecondData()
  {
    return this.second_data;
  }
}

TestClass t = new TestClass();
t.first_data = 5;
t.getSecondData();

public class Button : Object
{
  public Button() { }
  public Button.with_label(string label);
  public Button.from_stock(string stock_id);
}

new Button();
new Button.with_label("Click me!");
new Button.from_stock(Gtk.STOCK_OK);

public class Point : Object 
{
  public double x;
  public double y;

  public Point(double x, double y)
  {
    this.x = x;
    this.y = y;
  }

  public Point.rectangular(double x, double y)
  {
    this(x, y)
  }

  public Point.polar(double radius, double angle)
  {
    this.rectangular(radius * Math.cos(angle), radius * Math.sin(angle));
  }
}

void main()
{
  var p1 = new Point.rectangular(5.7, 1.2);
  var p2 = new Point.polar(5.7, 1.2);
}

class Demo : Object
{
  ~Demo() {
    stdout.printf("in destructor");
  }
}