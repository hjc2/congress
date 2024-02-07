


public class DragRect {
  
    final float mini = 50;
    
    PApplet parent;
    float x1, y1;
    float x2, y2;
    int tolerance;
    
    int wasEdge;
    
     public DragRect(PApplet p, float x1, float y1, float x2, float y2) {
      parent = p;
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      tolerance = 5;
      wasEdge = 0;
    }
    
    
    public void display(){
      
      stroke(0);
      fill(255);
      strokeWeight(tolerance);
      rectMode(CORNERS);
      rect(x1,y1,x2,y2);
    }
    
    public void update(){
            
      if(mousePressed){
        
        if(inBox
        
        int choice = edgeTolerance();
        
        if(wasEdge != 0){
          choice = wasEdge;
        }
        
        if(choice != 0){
          
          wasEdge = choice;
      
          switch (choice) {
            case 1:
              y1 = mouseY;
              break;
            case 2:
              x2 = mouseX;
              break;
            case 3:
              y2 = mouseY;
              break;
            case 4:
              x1 = mouseX;
              break;
          }

        }
      } else {
        
        wasEdge = 0;
      }
        
    }
    
    private boolean inBox(){
       return mouseX >= min(x1, x2) && mouseX <= max(x1, x2) && mouseY >= min(y1, y2) && mouseY <= max(y1, y2);
    }

    
    private int edgeTolerance(){
      
      if(inBox()) return 0;
      if (distLine(x1, y1, x2, y1) < tolerance) return 1; // Top edge
      if (distLine(x2, y1, x2, y2) < tolerance) return 2; // Right edge
      if (distLine(x1, y2, x2, y2) < tolerance) return 3; // Bottom edge
      if (distLine(x1, y1, x1, y2) < tolerance) return 4; // Left edge
      return 0; // no edge
    }
    
    // y1 to 1
    // x2 to 2
    // y2 to 3
    // x1 to 3
    
    private float distLine(float x1, float y1, float x2, float y2) {
      float x0 = mouseX;
      float y0 = mouseY;
      
      float a = y2 - y1;
      float b = x1 - x2;
      float c = x2 * y1 - x1 * y2;
      
      float d = abs(a * x0 + b * y0 + c) / sqrt(a * a + b * b);
      
      return d;
    }

}
