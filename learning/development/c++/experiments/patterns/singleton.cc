#include <iostream>
#include <string>

using namespace std;

class StringSingleton
{
  public: 
    string GetString() const
    {
      return mString;
    }                
    
    void SetString(const string &newStr)
    {
      mString = newStr;
    }                  
    
    static StringSingleton* Instance()
    {
      static StringSingleton *instance = new StringSingleton;
      
      return instance;
    }   
    
  private: 
    string mString;  
};

int main()
{          
  StringSingleton* bob = StringSingleton::Instance();
  
  bob->SetString("bob");
  
  cout << bob->GetString() << endl;
  return 0;
}