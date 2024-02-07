


public class BarChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int bars;
  
  int selected;
  
  int congress;
  //int party
  
  public BarChart(Table t){
    
    xPad = 120;
    yPad = 100;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    congress = 115; // or 116, which is old
    
    bars = table.getRowCount();
  }
  
  // main draw function for bar chart!
  void draw(){
    drawGrid();
    drawBars();
    
    title();
    legend();
    
    selected = selectBar();
    // this is 100% intentional as I want the bar to be able to cover part of the text.
    
    // it's too late for me to squeeze everything in, I just want it to look ok. I think this is the only time it should effect is youngRep @100%.
    
    drawButtons();
  }
  
  // draws the grid the bar chart is on
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
  
  // draws the bars
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
               
        // bottom left, top right
        rect(x * thickness + xPad, chartHeight + yPad, (x+1) * thickness + xPad, (chartHeight - voteHeight) + yPad);
        
        
        if(x == selected){
          fill(20,20,20, 150);
          rect(x * thickness + xPad, chartHeight + yPad, (x+1) * thickness + xPad, (chartHeight - voteHeight) + yPad);
        }
        x += 1;
    }
  }
  
  // will pick a bar and return the "selected bar"
  int selectBar(){
    if(mouseX > xPad && mouseX < chartWidth + xPad){
      int place = (int)map(mouseX, xPad, chartWidth + xPad, 0, bars);
      TableRow row = table.getRow(place);
      
      float voteHeight = map(float(row.getString("agree_pct")), 0, 1, chartHeight + yPad, yPad);
    
      if(mouseY > voteHeight && mouseY < chartHeight + yPad){
        displayInfo(place);
        
        return(place);
      }
    }
    return(-1);
  }
  
  void displayInfo(int k){
    

    
    TableRow row = table.getRow(k);
    
    String name = row.getString("last_name");
    
    float thickness = float(chartWidth) / float(bars);

    float vote = float(row.getString("agree_pct"));
    float voteHeight = map(float(row.getString("agree_pct")), 0, 1, chartHeight + yPad, yPad);
    
    String st = row.getString("state");


    String b = String.format("%.2f",vote * 100);
    
    float xv = xPad + thickness * k - 45;
        
    
    // makes white box behind text to destroy grid lines
    noStroke();
    rectMode(CORNERS);
    //stroke(255);
    fill(255);
    rect(xv - 10 + 5, voteHeight - 26, xv + 60, voteHeight - 5);
    
   stroke(0);
    fill(0);
    textSize(25);
    
    text("Senator " + name + ", " + st, 15, 150);
    
    stroke(0);
    fill(0);
    textSize(20); 
    text(b + "%", xv, voteHeight - 10);
    
    
  }
  
  void title(){
    stroke(0);
    fill(0);
    
    textSize(30);
    
    text("Senate Voting Alignment with Trump by Senator and Party Affiliation", 160, 80);
    
    textSize(25);
    text("Senators", width / 2 - 60, height - 55);
      
    
  }
  
  void legend(){
    
      textSize(20);
      rectMode(CORNER);

      choosePartyFill("D");
      rect(width - xPad - 100, height - 85, 15, 15);
      choosePartyFill("R");
      rect(width - xPad - 100, height - 60, 15, 15);
      choosePartyFill("I");
      rect(width - xPad - 100, height - 35, 15, 15);

      fill(0);
      stroke(0);
      text("democrats", width - 195, height - 70);
      text("republicans", width - 195, height - 45);
      text("independents", width - 195, height - 20);

      
   
  }
  
  void drawButtons(){
    
      fill(40,40,40);
      stroke(0);
      
    circle(50, height - 50, 15);
    circle(50, height - 75, 15);

    
  }
  
  int buttons(){
    
    if(mousePressed && distance(mouseX, mouseY, 50, height - 50) < 15){
      congress = 115;

      return(1);
    }
    
    if(mousePressed && distance(mouseX, mouseY, 50, height - 75) < 15){
      congress = 116;
      return(2);
      
    }
        
    return(0);
  }
  
}
