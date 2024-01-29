

Table table;

void setup(){
  
  size(800,800);
  
  table = loadTable("congress.csv", "header");
  
}


void draw(){
  
  background(255);
  stroke(0);
  strokeWeight(1);
  fill(0);
  
  int senate = 116;
  

  barChart(table, 116);
  
}
