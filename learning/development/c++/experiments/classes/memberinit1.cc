#include <iostream>             

using namespace std;

class Foo
{
  public:
    Foo(int x) { cout << "Foo called first" << endl << endl; }
};

class Bar : public Foo
{
  public:
    Bar() : Foo(10) { cout << "Bar called second" << endl << endl;}
};

int main()
{
  Bar bar;
  return 0; 
}