

void parallel(Table t){
  
  for (TableRow row : t.rows()) {    
    
    drawLine(row);
    
  }
}


void drawLine(TableRow r){
  
  //Party, Total votes, agree pct, net trump vote.
  
  float votes = float(r.getString("votes"));
  float agree = float(r.getString("agree_pct"));
  float net = float(r.getString("net_trump_vote"));
  
  String party = r.getString("party");
  
  float totalVotes = map(votes, 0, 200, height - 100, 100);
  float totalAgree = map(agree, 0,1, height - 100, 100);
  float totalNet = map(net, -50, 50, height - 100, 100);
    
  choosePartyStroke(party);
  strokeWeight(1);
  noFill();
  
  beginShape();
  vertex(100, totalVotes);
  vertex(600, totalAgree);
  vertex(800, totalNet);
  endShape();
  
}
