#include <iostream>    

using namespace std;

int main () 
{
  int weight = 50;
  int *pWeight = &weight;
  int &rWeight = weight;
  
  int another = 123;
  int athird = 770;
  
  cout << "weight: " << weight << endl;
  cout << "pWeight: " << pWeight << endl;
  cout << "*pWeight: " << *pWeight << endl; 
  cout << "rWeight: "  << rWeight << endl << endl;         
  
  rWeight =  another;   
  
  cout << "weight: " << weight << endl;
  cout << "pWeight " << pWeight << endl;
  cout << "*pWeight: " << *pWeight << endl;
  cout << "rWeight: " << rWeight << endl << endl; 
  
  pWeight = &athird;
  
  cout << "weight: " << weight << endl;
  cout << "pWeight: " << pWeight << endl;
  cout << "*pWeight: " << *pWeight << endl;
  cout << "rWeight: " << rWeight << endl;
  cout << "&athird: "  << &athird << endl << endl;  
  
  return 0;
}