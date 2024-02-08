


public class Pulse {

  int prevState;
  int state;
  int x;
  int y;
  
  
  public Pulse(int x, int y){
    prevState = 1;
    state = 1;
    this.x = x;
    this.y = y;
    
  }
  
  public void update(){
    
    prevState = state;
    
    if(mousePressed){
      if(dist(mouseX, mouseY, x+20, y+22) < 25){
        state = 1;
      }
      
      if(dist(mouseX, mouseY, x+20, y+58) < 25){
        state = 2;
      }        
    }
  

}
  
  public void draw(){
    
    rectMode(CORNERS);
    
    stroke(0);
    noFill();
    strokeWeight(3);
    
    rect(x, y, x + 40, y + 80, 5);
    

    circle(x + 20, y + 22, 25);
    circle(x + 20, y + 58, 25);
    
    noStroke();
    fill(100);
    if(state == 1){
        circle(x + 20, y + 22, 25);
    }
    
    if(state == 2){
        circle(x + 20, y + 58, 25);
    }
  }
  
}
