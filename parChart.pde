
import processing.core.PApplet;


public class ParChart {
  Table table;
  
  int xPad;
  int yPad;
  int chartWidth;
  int chartHeight;
  
  int totalVotes; // max number in the dataset
  float minTrump;
  float maxTrump;
  
  ArrayList<DragRect> rects;
  
  private int maxvote;
  
  
  
  public ParChart(Table t){
    
    xPad = 140;
    yPad = 120;
    chartWidth = width - (2 * xPad);
    chartHeight = height - (2 * yPad);
    table = t;
    
    for (TableRow row : t.rows()) {
      totalVotes = (int(row.getString("votes")) > totalVotes) ? int(row.getString("votes")) : totalVotes;
      float netTrump = float(row.getString("net_trump_vote"));
      
      minTrump = (netTrump  < minTrump) ? netTrump : minTrump;
      maxTrump = (netTrump  > maxTrump) ? netTrump : maxTrump;
    }
    
    println(minTrump);
    println(maxTrump);

    rects = new ArrayList<DragRect>(); // Initialize the ArrayList
    
        
  }
  
  
    
    // "total totalVotes", "predicted", "agree_pct", "trump %"
    
 
   public void update(){
     
    for (DragRect rect : rects) {
       
      rect.update();
       
    }
     
   }
      
  public void draw(){
    
    grid();
    
    lines();
    
    for (DragRect rect : rects) {
       
      rect.display();
       
   }
    
  }
  
  public void newRect(){
    
   rects.add(new DragRect(400, 400, 600, 600)); // Create a DragRect object
    
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


        if(i == 0){

            for(int j = 0; j < 6; j++){
            line(tmpX - 10, yPad + j * (chartHeight / 5), tmpX, yPad + j * (chartHeight / 5));
            textSize(15);

            text(str(int(totalVotes - j * (float(totalVotes) / 5))), tmpX - 30, yPad + j * (chartHeight / 5));
            }
        } else if(i == 3){
          
            for(int j = 0; j < 6; j++){
              line(tmpX - 10, yPad + j * (chartHeight / 5), tmpX, yPad + j * (chartHeight / 5));
              
              String label = str(100.0 - j * 20 - 50);
    
            
              textSize(15);
              text(label + "%", tmpX - 55,  yPad + j * (chartHeight / 5));
            }
          
          
        } else {
          for(int j = 0; j < 6; j++){
            
            line(tmpX - 10, yPad + j * (chartHeight / 5), tmpX, yPad + j * (chartHeight / 5));
            
            String label = str(100.0 - j * 20);
  
          
            textSize(15);
            text(label + "%", tmpX - 55,  yPad + j * (chartHeight / 5));
          }
        
        }
      }
    
  }
  
  
  private void lines(){
    
    for (TableRow row : table.rows()) {
    
      drawLine(row);
    }
  }
  
  private void drawLine(TableRow row){
    
     int i = 0;
     
     int votes = int(row.getString("votes"));
     float voteMap = map(votes, 0, totalVotes, height - yPad, yPad);
     
     float pred = float(row.getString("predicted_agree"));
     float predMap = map(pred, 0, 1.0, height - yPad,yPad);
     
     float agree = float(row.getString("agree_pct"));
     float agreeMap = map(agree, 0, 1.0, height - yPad, yPad);

     float net = float(row.getString("net_trump_vote"));
     float netMap = map(net, -50.0, 50.0, height - yPad, yPad);
    
     String party = row.getString("party");


     choosePartyStroke(party);
     
     if(rects.size() > 0){
       
       
      boolean flag = false;
      
      for (DragRect rect : rects) {
        
        if(rect.lineIntersectsRectangle(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap)){
          

          flag = true;
        }
        if(flag){
            line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);

        }
      }
             
       
     } else {
     
      line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
      i++;
      line(xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
      i++;
      line(xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
      
     }
  }
}
  
  
