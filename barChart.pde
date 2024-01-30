

void barChart(Table t) {

  drawGrid();

  float k = t.getRowCount();

  int chartWidth = width - 200;
  int chartHeight = height - 100;


  float thickness = chartWidth / k;
  float x = 0;

  rectMode(CORNERS);
  
  for (TableRow row : t.rows()) {


    float vote = float(row.getString("agree_pct"));
    String party = row.getString("party");

    float voteHeight =  map(vote, 0, 1, 0, chartHeight);

    stroke(0);
    strokeWeight(2);
    choosePartyFill(party);
  
    //rect(x + 100, chartHeight - voteHeight + 200, thickness, voteHeight);
    
    //rect(x + 100, chartHeight - voteHeight + 100, x + 100 + thickness, chartHeight);

    x += thickness;
  }
  
  legend(t);
}

void drawGrid() {
  
  stroke(0);
  strokeWeight(2);
  for (int x = 0; x <= 5; x++) {

    float h = 120 * x + 100;

    line(80, h, 1120, h);

    text((100 - (x * 20)), 40, h);
  }
}

void legend(Table t){
  
  //rectangle();
  
}
