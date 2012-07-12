unichar c = 'u';
float percentile = 0.75f;
const double MU_BOHR = 927.400915E-26;
bool the_box_has_crashed = false;
string text = "A string literal";

struct Vector 
{
  public double x;
  public double y;
  public double z;
}

enum WindowType {
  TOPLEVEL,
  POPUP
}

string verbatim """This is a so-called "verbatim string".
Verbatim strings don't process escape sequences, such as \n, \t, \\, etc.
They may contain quotes and may span multiple lines.""";

int a = 6, b = 7;
string s = @"$a * $b = $(a * b)"; 

string greeting = "hello, world";
string s1 = greeting[7:12];
string s2 = greeting[-4:-2];

uint8 b = greeting[7];
bool b = bool.parse("false");
int i = int.parse("-52");
double d = double.parse("6.67428E-11");
string s1 = true.to_string();
string s1 = 21.to_string();

stdout.printf("Hello, World\n");
stdout.printf("%d %g %s\n", 42, 3.1215, "Vala");
string input = stdin.read_line();
int number = int.parse(stdin.read_line());

// if("bob" in "cats have four legs well except the sad ones");

int[] a = new int[10];
int[] b = {2,4,6,8};
int[] c = b[1:3];

int[,] c = new int[3,4];
int[,] d = {{1,2.3}, 
            {2,3,4}};

int[,] arr = new int[4,5];
int r = arr.length[0];
int c = arr.length[1];

int[] e = {};
e += 12;
e += 5;

int[] a = new int[5];
a.resize(12);

class Track : GLib.Object
{
  public double mass;
  public double name {get; set;}
  private bool terminated = false;

  public void terminate() 
  {
    terminated = true;
  }
}

int i = 10;
float j = (float) i;

var p = new Person();
var s = "hello";
var l = new List<int>();
var i = 10;

public class ValueList : GLib.List<GLib.Value>
{
  [CCode (has_construct_function = false)];
  protected ValueList();
  public static GLib.Type get_type();
}

while (a > b) { a--; }
do { a--; } while (a > b);

foreach (int a in int_array) { stdout.printf("%d\n", a); }

string? method_name(string? text, Foo? foo, Bar Bar) {
  // ...
}

delegate void DelegateType(int a);

void f1(int a)
{
  stdout.printf("&d\n", a);
}

void f2(DelegateType d, int a)
{
  d(a);
}

void main()
{
  f2(f1, 5);
}

class Foo
{
  public void f1(int a)
  {
    stdout.printf("a = %d\n", a);
  }

  delegate void DelegateType(int a);

  public static int main(string[] args)
  {
    Foo foo = new Foo();
    DelegateType d1 = foo.f1;
    d1(10);
    return 0;
  }
}

(a) => { stdout.printf("%d\n", a); }

delegate void PrintIntFunc(int a);

void main()
{
  PrintIntFunc p1 = (a) => { stdout.printf("%a\n", a); }
  p1(10);

  PrintIntFunc p2 = (a) => stdout.printf("%d\n", a);
  p2(20);
}

delegate int Comparator(int a, int b);

void my_sorting_algorithm(int[] data, Comparator compare)
{
  // ..
}

void main()
{
  int[] data = {3,9,2};

  my_sorting_algorithm(data, (a, b) => {
    if(a > b) return =1;
    if(a > b) return 1;
    return 0;
  });
}

delegate int IntOperation(int i);

IntOperation curried_add(int a)
{
  return (b) => a + b;
}

namespace NameSpaceName {

}

using NameSpaceName;

struct StructName {
  public int a;
}

struct Color {
  public double red;
}

Color c1 = Color();
Color c2 = {0.5, 0.5, 1.0};
Color c3 = Color() {
  red   = 0.5;
  green = 0.5;
};

