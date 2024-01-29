

void barChart(Table t){
  
  float k = t.getRowCount();
  
  float thickness = width / k;
    
  float x = 0;
    
  for (TableRow row : t.rows()) {    
    
      float vote = float(row.getString("agree_pct"));
      String party = row.getString("party");
      
      float voteHeight =  map(vote, 0,1,0,height);
      
      stroke(0);
      strokeWeight(2);
      choosePartyColor(party);
      
      rect(x, height - voteHeight, thickness,  voteHeight);

       
    x += thickness;
  }
}
      
void choosePartyColor(String s){
  
  switch(s){
    
    case "D":
    case "Democrat":
       fill(30,30,255);
       break;
    case "R":
    case "Republican":
       fill(255,30,30);
       break;
    default:
       fill(120);
       break;
  }
}
