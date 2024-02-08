


public class Pulse {

  
  int state;
  
  
  public Pulse(){
    
    state = 1;
    
  }
  
  public void update(){
    if(mousePressed){
    
      //if(dist(mouseX, 
      
    }}
  
  public void draw(){
    
    rectMode(CORNERS);
    
    stroke(0);
    noFill();
    strokeWeight(3);
    
    rect(width - 90, height / 2 - 40, width - 50, height / 2 + 40, 5);
    
    
    circle(width - 70, height / 2 - 18, 20);
    circle(width - 70, height / 2 + 18, 20);

  }
  
}
