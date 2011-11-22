#include <iostream>    

using namespace std; 

int Calculate(int v) {
  v += 100;
  return v;
}

int main()
{     
  int i, final;
  i = 500;
  final = Calculate(i); 
  
  cout << final;
  return 0;     
}   

