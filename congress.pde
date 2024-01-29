

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
  
  //pushMatrix();
    /*

  int x = 0;
  int y = 0;
  int total = 0;
  
  for (TableRow row : table.rows()) {
    {
      int year = int(row.getString("congress"));
      float vote = float(row.getString("agree_pct"));
      if(year == senate){
        
        total += 1;
        
        fill(map(vote, 0, 1, 0, 255),0,map(vote, 0, 1, 255, 0));
        circle(80 * x, 80 * y, 40);
        
        if(x < 9){
          x += 1;
        } else {
          y += 1;
          x = 0;
        }
      }
      
    }
    
  } */
  
  //println(total);
  
}
