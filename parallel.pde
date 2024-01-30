

void parallel(Table t){
  
  gridLines();
  
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
  
  float totalVotes = map(votes, 0, 86, height - 100, 100);
  float totalAgree = map(agree, 0,1, height - 100, 100);
  float totalNet = map(net, -50, 50, height - 100, 100);
    
  choosePartyStroke(party);
  strokeWeight(3);
  noFill();
  
  beginShape();
  vertex(100, totalVotes);
  vertex(600, totalAgree);
  vertex(1100, totalNet);
  endShape();
}

void gridLines(){
  
  int[] xCoords = {100, 600, 1100};

  
  stroke(0);
  strokeWeight(2);
  
  for (int i = 0; i < xCoords.length; i++) {
    line(xCoords[i],100, xCoords[i], height - 100);
  }
  
}
