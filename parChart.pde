

public class ParChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int votes; // max number in the dataset
  
  private int maxvote;
  
  
  public ParChart(Table t){
    
    xPad = 120;
    yPad = 100;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    for (TableRow row : t.rows()) {
      votes = (int(row.getString("votes")) > votes) ? int(row.getString("votes")) : votes;
    }
    
  }
    
    // "total votes", "predicted", "agree_pct", "trump %"
    
      
      
}
  
  
