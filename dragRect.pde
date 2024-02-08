


public class DragRect {
  
    final float mini = 50;
    
    //PApplet parent;
    float x1, y1;
    float x2, y2;
    int tolerance;
    
    private float offsetX, offsetY; // Declare offsetX and offsetY as class members


    int wasEdge;
    boolean dragging;
    
     public DragRect(float x1, float y1, float x2, float y2) {
      //parent = p;
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      tolerance = 8;
      wasEdge = 0;
    }
    
    
    public void display(){
      
      stroke(0);
      noFill();
      strokeWeight(3);
      rectMode(CORNERS);
      rect(x1,y1,x2,y2);
    }
    
    public void update(){
            
      if(mousePressed){
        
        // previously in the state of being moved
        if(dragging){
          setCorners();
         
          return;
        } 
        dragging = false;
        
        
        // checking for tolerance 
        int choice = edgeTolerance();
        
        // checking if there was a previous edge
        if(wasEdge != 0){
          choice = wasEdge;
        }
        
        // deciding if there is an edge
        if(choice != 0){
          
          wasEdge = choice;
      
          switch (choice) {
            case 1:
              y1 = (y2 - mouseY > mini) ? mouseY : y1;
              break;
            case 2:
              x2 = (mouseX - x1 > mini) ? mouseX : x2;
              break;
            case 3:
              y2 = (mouseY - y1 > mini) ? mouseY : y2;
              break;
            case 4:
              x1 = (x2 - mouseX > mini) ? mouseX : x1;
              break;
          }
          
          return;

        }
        
        //backup new inside box
        if(inBox()){
                    
          offsetX = mouseX - (x2 + x1) / 2;
          offsetY = mouseY - (y2 + y1) / 2;
         
          setCorners();

          return;
          
        }
      } else {
        dragging = false;
        wasEdge = 0;
        offsetX = 0;
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
    
    private void setCorners(){
      
        dragging = true;
        float halfWidth = (x2 - x1) / 2, halfHeight = (y2 - y1) / 2;
        x1 = mouseX - halfWidth; y1 = mouseY - halfHeight;
        x2 = mouseX + halfWidth; y2 = mouseY + halfHeight;
        
        x1 -= offsetX;
        x2 -= offsetX;
        y1 -= offsetY;
        y2 -= offsetY;
    }
    
    private float distLine(float x1, float y1, float x2, float y2) {
      float x0 = mouseX;
      float y0 = mouseY;
      
      float a = y2 - y1;
      float b = x1 - x2;
      float c = x2 * y1 - x1 * y2;
      
      float d = abs(a * x0 + b * y0 + c) / sqrt(a * a + b * b);
      
      return d;
    }
    
    
      public boolean lineInter(float x3, float y3, float x4, float y4) {
        // Check if the line intersects any of the rectangle's edges
        boolean topIntersects = lineSegmentsIntersect(x1, y1, x2, y2, x3, y3, x4, y3);
        boolean rightIntersects = lineSegmentsIntersect(x1, y1, x2, y2, x4, y3, x4, y4);
        boolean bottomIntersects = lineSegmentsIntersect(x1, y1, x2, y2, x3, y4, x4, y4);
        boolean leftIntersects = lineSegmentsIntersect(x1, y1, x2, y2, x3, y3, x3, y4);
    
        // Return true if any intersection occurs
        return topIntersects || rightIntersects || bottomIntersects || leftIntersects;
        }
    
    private boolean lineSegmentsIntersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
        return (x1 < max(x3, x4) && x2 > min(x3, x4) && y1 < max(y3, y4) && y2 > min(y3, y4));
    }

}
