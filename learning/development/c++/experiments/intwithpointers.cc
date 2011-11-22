#include <iostream>    

using namespace std; 

void Calculate(int *v) {
  *v += 200;  
}

int main()
{     
  int i;
  i = 500; 
  int* final = &i; 
  Calculate(final); 
  
  cout << i;
  return 0;     
}