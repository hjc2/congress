
import processing.core.PApplet;
import java.util.Iterator;

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
  
  int dragging = -1;
  
  int scaling = -1;
  
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
     
     handleMove();
     
     trashCan();

   }
   
   private void handleMove(){
     
    boolean flagDrag = false;

    if(dragging != -1){
      
      rects.get(dragging).update();
      
      //flagDrag = true;
      
      flagDrag = rects.get(dragging).dragging;
      flagDrag = flagDrag || rects.get(dragging).wasEdge != 0;
      
    } else {
    
    for (int i = 0; i < rects.size(); i++) {
       
      rects.get(i).update();
      
      if(rects.get(i).dragging || rects.get(i).wasEdge != 0){
        
        dragging = i;
        
        flagDrag = true;
        
        break;
      }
      
      println(i);
      
    }
    }
    
    if(!flagDrag){
      dragging = -1;
    }
   }
   
      
  public void draw(){
    
    // do all the turned off lines before the on lines
    // the grey lines
    for (TableRow row : table.rows()) {
    
      drawLine(row, false);
    }
    
    grid();
    
    lines();
    
    for (DragRect rect : rects) {
       
      rect.display();
       
   }
   
   drawTrash();
    
  }
  
  public void newRect(){
    
   rects.add(new DragRect(440, 440, 500, 500)); // Create a DragRect object
    
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
    

    // now all the on lines
    for (TableRow row : table.rows()) {
    
      drawLine(row, true);
    }
    
  }
  
  private void drawLine(TableRow row, boolean onOff){
    
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
     
     boolean flag = true;
     
     if(rects.size() > 0){
       
      flag = false;
      
      for (DragRect rect : rects) {
        flag = flag || (rect.lineInter(xPad + 0 * chartWidth / 3.0, voteMap,  xPad + 1 * chartWidth / 3.0, predMap) || 
           rect.lineInter(xPad + 1 * chartWidth / 3.0, predMap, xPad + 2 * chartWidth / 3.0, agreeMap) || 
           rect.lineInter(xPad + 2 * chartWidth / 3.0, agreeMap, xPad + 3 * chartWidth / 3.0, netMap));
      }
             
     }
     
     
     if(flag){
      
      if(onOff){
        choosePartyStroke(party);
        strokeWeight(3);
        
        line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
        i++;
        line(xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
        i++;
        line(xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
      }
     }  else {
       
       if(!onOff){
       strokeWeight(1);
       stroke(140,140,140);
       
       line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
        i++;
        line(xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
        i++;
        line(xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
       }
     }
  }
  
  void trashCan(){
    
    //void deleteRectanglesInBox(ArrayList<DragRect> rects, float boxX, float boxY, float boxWidth, float boxHeight) {
      float boxX = 800;
      float boxY = 680;
      float boxWidth = 100;
      float boxHeight = 100;
      //Iterator<DragRect> iterator = rects.iterator();
      //while (iterator.hasNext()) {
      //DragRect rect = iterator.next(); // Get the next rectangle

      //if (rect.x1 >= boxX && rect.x2 <= boxX + boxWidth && rect.y1 >= boxY && rect.y2 <= boxY + boxHeight) {
      //  iterator.remove(); // Remove the rectangle from the ArrayList
      //}
      
      int toR = -1;
      
      for(int i = 0; i < rects.size(); i++){
          
        //DragRect rec = rects.get(i);
        if (rects.get(i).x1 >= boxX && rects.get(i).x2 <= boxX + boxWidth && rects.get(i).y1 >= boxY && rects.get(i).y2 <= boxY + boxHeight) {
          
          toR = i;
          
        }
      }
      
      if(toR != -1){
        
        newRect();
        
        rects.remove(toR);
      }
        
  }
  
  void drawTrash(){
    
    stroke(200,40,40);
    strokeWeight(3);
    noFill();
    rectMode(CORNERS);
    rect(800,680,900,780);
    
  }
    
}
  
  
