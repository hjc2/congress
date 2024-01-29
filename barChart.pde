

void barChart(Table t){
  
  float k = t.getRowCount();
  
  float thickness = width / k;
  
  println(thickness);
  
  int x = 0;
  
  for (TableRow row : t.rows()) {    
    
      float vote = float(row.getString("agree_pct"));
      
     
     rect(x,0,thickness, map(vote, 0,1.0,0.0,400) + 15);
        
    x += thickness;
  }
}
