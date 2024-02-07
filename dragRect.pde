


public class DragRect {
    PApplet parent;
    float x1, y1;
    float x2, y2;
    int tolerance;
    
     public DragRect(PApplet p, float x1, float y1, float x2, float y2) {
      parent = p;
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      tolerance = 5;
    }
    
    
    public void display(){
      
      stroke(0);
      fill(255);
      
      rectMode(CORNERS);
      rect(x1,y1,x2,y2);
    }
    
    public void update(){
      
      println(distLine(x1, y1, x2, y1));
      
    }
    
    float distLine(float x1, float y1, float x2, float y2) {
      
    float x0 = mouseX;
    float y0 = mouseY;
    
    // Calculate the coefficients a, b, and c for the line equation
    float a = y2 - y1;
    float b = x1 - x2;
    float c = x2 * y1 - x1 * y2;
    
    // Calculate the distance from the point to the line
    float d = abs(a * x0 + b * y0 + c) / sqrt(a * a + b * b);
    
    return d;
    
    }

}
