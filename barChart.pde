


public class BarChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int bars;
  
  int selected;
  
  public BarChart(Table t){
    
    xPad = 120;
    yPad = 100;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    bars = table.getRowCount();
  }
  
  
  void draw(){
    drawGrid();
    drawBars();
    selectBar();
    
    strokeWeight(5);
    stroke(255,0,255);
    point(xPad,yPad + chartHeight);
    point(xPad + chartWidth,yPad + chartHeight);

  }
  
  void drawGrid(){
    stroke(0);
    strokeWeight(2);
    fill(0);
    
    int ts = 30;
    
    textSize(ts);
    
    for (int x = 0; x <= 5; x++) {      
      float h = (chartHeight / 5 * x) + yPad;
      
      line(xPad - 20, h, xPad + chartWidth + 20, h);
      
      String label = str((chartHeight - (chartHeight / 5 * x)) / 6);
      
      text(label + "%", xPad / 2 - 30, h + ts / 3);
    }
  }
  
  void drawBars(){
    
    rectMode(CORNERS);

    float x = 0;
    
    float thickness = float(chartWidth) / float(bars);
    
    stroke(0);
    strokeWeight(2);

    for (TableRow row : table.rows()) {
      
        float vote = float(row.getString("agree_pct"));
        String party = row.getString("party");

        float voteHeight =  map(vote, 0, 1, 0, chartHeight);

        choosePartyFill(party);
        
        if(x == selected) fill(20,20,20);
        
        // bottom left, top right
        rect(x * thickness + xPad, chartHeight + yPad, (x+1) * thickness + xPad, (chartHeight - voteHeight) + yPad);
        x += 1;
    }
  }
  void selectBar(){
    
    
    if(mouseX > xPad && mouseX < chartWidth + xPad){
            
      int place = (int)map(mouseX, xPad, chartWidth + xPad, 0, bars);
      
      TableRow row = table.getRow(selected);
      
      float vote = float(row.getString("agree_pct"));
      float voteHeight = map(vote, 0, 1, chartHeight + yPad, yPad);
      
      if(mouseY > voteHeight && mouseY < chartHeight + yPad){
        fill(0);
        textSize(30);
        
        String name = row.getString("last_name");
        
        
        text(name,0, 40);

      }
    }
  }
}
