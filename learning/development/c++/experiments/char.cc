#include <stdio.h>              
#include <string.h>
            
void GetCar(char *vehicle) {
  strncat(vehicle, "Year: 2007 hybrid", 18);  
}        

int main()
{
  char Car[500];
  sprintf(Car, 'Toyata Camry');
  GetCar(Car);

  printf("%s", Car); 
  
  return 0; 
}