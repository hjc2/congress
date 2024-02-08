

public class ParChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int votes; // max number in the dataset
  
  private int maxvote;
  
  
  public ParChart(Table t){
    
    xPad = 140;
    yPad = 120;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    for (TableRow row : t.rows()) {
      votes = (int(row.getString("votes")) > votes) ? int(row.getString("votes")) : votes;
    }
    
  }
    
    // "total votes", "predicted", "agree_pct", "trump %"
    
      
  public void draw(){
    
    grid();
    
  }
  
  private void grid(){
    
      String[] titles  = {"total votes", "predicted", "agree_pct", "trump %"};

      stroke(0);
      fill(0);
      strokeWeight(3);
      
      for(int i = 0; i < titles.length; i++) {
        
        int tmpX = xPad + i * chartWidth / 3;
        
        textSize(30);
        text(titles[i], tmpX - 40, yPad - 30);
        
        line(tmpX, yPad, tmpX, height - yPad);
        for(int j = 0; j < 6; j++){
          
          line(tmpX - 10, yPad + j * (chartHeight / 5), tmpX, yPad + j * (chartHeight / 5));
          
          String label = str(100.0 - j * 20);

        
          textSize(15);
          text(label + "%", tmpX - 55,  yPad + j * (chartHeight / 5));
        }
        
      }
    
  }
}
  
  
