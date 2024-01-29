

void barChart(Table t){
  
  float k = t.getRowCount();
  
  float thickness = width / k;
    
  float x = 0;
  
  stroke(20);
  
  for (TableRow row : t.rows()) {    
    
      float vote = float(row.getString("agree_pct"));
      String party = row.getString("party");
      
      fill(120);
      if(party.equals("D")){
        fill(30,30,255);
      }
      if(party.equals("R")){
        fill(255,30,30);
      }
         
     rect(x,0,thickness, map(vote, 0,1.0,0.0,600) + 15);
        
    x += thickness;
  }
}
