#include <string>
#include <iostream>         

using namespace std;

class Pizza
{
  public:
    void setDough(const string &dough)
    {
      m_dough = dough;
    }      
    
    void setSauce(const string &sauce)
    {
      m_sauce = sauce;
    }                 
    
    void setTopping(const string topping)
    { 
      cout << topping << endl << endl;
      m_topping = topping;
    }  
    
    string getTopping()
    {
      return m_topping;
    }  
    
  private:
    string m_dough;
    string m_sauce;
    string m_topping;
}; 

int main()
{          
  Pizza pizza_test;        
  pizza_test.setTopping("pickles");     
  
  cout << pizza_test.getTopping() << endl << endl;
  
  Pizza *bob = &pizza_test;
  
  bob->setTopping("pepperoni");     
  
  cout << bob->getTopping() << endl << endl;    
  
  cout << pizza_test.getTopping() << endl;

  return 0;
}