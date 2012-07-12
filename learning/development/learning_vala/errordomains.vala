public errordomain ErrorType1 {
  CODE_1A
}

public errordomain ErrorType2 {
  CODE_2A,
  CODE_2B
}

public class Test : GLib.Object {
  public static void thrower() throws ErrorType1, ErrorType2 {
    throw new ErrorType1.CODE_1A("Error");
  }

  public static void catcher() throws ErrorType2 
  {
    try {
      thrower();
    } catch (ErrorType1 e) {

    } finally {
      // cats
    }
  }

  public static int main(string[] args) 
  {
    try {
      catcher();
    } 
    catch (Error e) {
      if(e is ErrorType2.CODE_2B) {
        // handle that code
      }
    }

    return 0;
  }
}

void method_1(int a, out int b, ref int c) { 
  //
}

void method_2(Object o, out Object p, ref Object q) {
  //
}

int a = 1;
int b;
int c = 3;
method_1(a, out b, ref c);

Object o = new Object();
Object p;
Object q = new Object();
method_2(o, out p, ref q);

void method_1(int a, out int b, ref int c) {
  b = a + c;
  c = 3;
}

