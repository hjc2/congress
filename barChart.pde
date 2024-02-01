


public class BarChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  public BarChart(Table t){
    
    xPad = 100;
    yPad = 100;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
  }
  
  
  //void draw(){
  //  drawGrid();
  //}
  
  //void drawGrid(){
  //  stroke(0);
  //  strokeWeight(2);
    
  //  for (int x = 0; x <= 5; x++) {
  
  //    //float h = 120 * x + 100;
      
  //    float h = (chartHeight / 5 * x) + 100;
      
  
  //    line(80, h, 1120, h);
  
  //    text((100 - (x * 20)), 40, h);
  //  }
  //}
}


//void drawBars(Table t) {
  
//  float k = t.getRowCount();

//}
