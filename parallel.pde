

void parallel(Table t){
  
  for (TableRow row : t.rows()) {    
    
    drawLine(row);
    
  }
  // 
}


void drawLine(TableRow r){
  
  //Party, Total votes, agree pct, net trump vote.
  float agree = map(float(r.getString("agree_pct")),0,1,height - 50, 50);
  
  float votes = map(float(r.getString("votes")),0,186,height - 50, 50);
  
  
  float net = map(float(r.getString("net_trump_vote")), -50, 50, 50, height);
  
  
  
  line(100, agree, ((width - 200) / 3) + 100, votes);
  line(((width - 200) / 3) + 100, votes, ((width - 200) / 3) * 2, net);
  
}
