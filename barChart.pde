


public class BarChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int bars;
  
  public BarChart(Table t){
    
    xPad = 100;
    yPad = 100;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    bars = table.getRowCount();
  }
  
  
  void draw(){
    drawGrid();
    drawBars();
  }
  
  void drawGrid(){
    stroke(0);
    strokeWeight(2);
    fill(0);
    textSize(30);
    
    for (int x = 0; x <= 5; x++) {      
      float h = (chartHeight / 5 * x) + yPad;
      
      line(xPad, h, xPad + chartWidth, h);
      
      String label = str((chartHeight - (chartHeight / 5 * x)) / 6);
      
      text(label, xPad / 2, h);
    }
  }
  
  void drawBars(){
    
    rectMode(CORNERS);

    float x = xPad;
    
    float thickness = float(chartWidth) / float(bars);
    
    stroke(0);
    strokeWeight(2);

    for (TableRow row : table.rows()) {
      
        float vote = float(row.getString("agree_pct"));
        String party = row.getString("party");

        float voteHeight =  map(vote, 0, 1, 0, chartHeight);

        choosePartyFill(party);

        rect(x, chartHeight + yPad, x + thickness, chartHeight - voteHeight);
        x += thickness;

    }
  }
}
