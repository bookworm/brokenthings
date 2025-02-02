#include <iostream>

using namespace std;

class DrawingAPI
{
  public:
    virtual void drawCircle(double x, double y, double radius) = 0;
    virtual ~DrawingAPI() {}     
};   

class DrawingAPI1 : public DrawingAPI
{
  public:
    void drawCircle(double x, double y, double radius)
    {
      cout << "API1.circle at " << x << ':' << y << ' ' << radius << endl;
    }
};

class DrawingAPI2 : public DrawingAPI
{
  public:
    void drawCircle(double x, double y, double radius) 
    {
      cout << "API2.circle at " << x << ':' << y << ' ' <<  radius << endl;
    }
};   

class Shape
{
  public:
    virtual ~Shape() {}
    virtual void draw() = 0;
    virtual void resizeByPercentage(double pct) = 0;
};  

class CircleShape : public Shape
{
  public:
    CircleShape(double x, double y, double radius, DrawingAPI *drawingAPI)
      : m_x(x), m_y(y), m_radius(radius), m_drawingAPI(drawingAPI)
    { 
    }       
    
    void draw()
    {
      m_drawingAPI->drawCircle(m_x, m_y, m_radius);
    }   
    
    void resizeByPercentage(double pct)
    {
      m_radius *= pct;
    }  
    
  private:  
    double m_x, m_y, m_radius;
    DrawingAPI *m_drawingAPI;
};  

int main(void)
{          
  CircleShape circle1(1,2,3,new DrawingAPI1());
  CircleShape circle2(5,7,11,new DrawingAPI2());
  circle1.resizeByPercentage(2.5);
  circle2.resizeByPercentage(2.5);
  circle1.draw();
  circle2.draw(); 
  
  return 0;
}