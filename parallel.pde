

class bar {
  int xcord;
  String title;
  float lowerBound;
  float upperBound;
}

void parallel(Table t) {

  gridLines();

  text("text", 50, 50);

  for (TableRow row : t.rows()) {

    drawLine(row);
  }
}


void drawLine(TableRow r) {
  
  float votes = float(r.getString("votes"));
  float pred = float(r.getString("predicted_agree"));
  float agree = float(r.getString("agree_pct"));
  float net = float(r.getString("net_trump_vote"));
  

  String party = r.getString("party");

  //float totalVotes = map(votes, 0, 86, height - 100, 100);
  float totalVotes = map(votes, 0, 45, height - 100, 100);

  float totalPred = map(pred, 0,1, height - 100, 100);
  float totalAgree = map(agree, 0, 1, height - 100, 100);
  float totalNet = map(net, -50, 50, height - 100, 100);

  choosePartyStroke(party);
  strokeWeight(3);
  noFill();

  beginShape();
  vertex(100, totalVotes);
  vertex(433, totalPred);
  vertex(766, totalAgree);
  vertex(1100, totalNet);
  endShape();
}

void gridLines() {

  int[] xCoords = {100, 433, 766, 1100};
  String[] titles  = {"total votes", "predicted", "agree_pct", "trump %"};

  stroke(0);
  strokeWeight(2);

  textSize(20);
  fill(0);

  for(int i = 0; i < xCoords.length; i++) {
    line(xCoords[i], 100, xCoords[i], height - 100);
    stroke(0);
    text(titles[i], xCoords[i] - 40, 80);
  }
  
  
  
}


// highlight line.

// 
