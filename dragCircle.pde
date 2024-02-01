

public class DragCircle {
    PApplet parent;
    float x, y;
    float diameter;
    boolean dragging = false;
    float offsetX, offsetY;

    public DragCircle(PApplet p, float x, float y, float diameter) {
        parent = p;
        this.x = x;
        this.y = y;
        this.diameter = diameter;
    }
    
    public boolean isMouseInside() {
        float d = parent.dist(parent.mouseX, parent.mouseY, x, y);
        return (d < diameter / 2);
    }

    public void display() {
        parent.stroke(0);
        parent.fill(175);
        parent.ellipse(x, y, diameter, diameter);
    }

    public void update() {
        if (mousePressed) {
          if(dragging){
            //this.x = mouseX;
            this.y = mouseY;
          } 
          
         if(isMouseInside()){
            dragging = true;
            
            //this.x = mouseX;
            this.y = mouseY;
        }
        
        
    } else {
      dragging = false;
    }
    }
}
