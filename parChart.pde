
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
  
  float distance = 100;
  float lin = -1;
  
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
    

    rects = new ArrayList<DragRect>(); // Initialize the ArrayList
    
        
  }
  
  
    
    // "total totalVotes", "predicted", "agree_pct", "trump %"
    
 
   public void update(){
     

     
     
     handleMove();
     
     if(rects.get(rects.size() - 1).x1 != 50){
       
       newRect();
       
     }//, 440, 500, 500
     //50, 440, 110, 500)
     
     //trashCan();
     
     int label = -1;
     
     for(int i = 0; i < rects.size(); i++){
       
       //if(rects.get(i).x1 > width - xPad + 40 || rects.get(i).x2 < 40 || rects.get(i).y1 > height - yPad + 20 || rects.get(i).y2 < 20){
       
      if(rects.get(i).x2 > width - 40 || rects.get(i).x1 < 20 || rects.get(i).y1 > height - yPad + 20 || rects.get(i).y1 < 20){

         label = i;
       }
       
     }
     
     if(label != -1){
       
       rects.remove(label);
       dragging = -1;
       scaling = -1;
     }

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
        
        i = rects.size();
      }
            
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
   
   legend();
   title();
   drawCon();
   //drawTrash();
   
   if(dragging == -1 && scaling == -1){
        important();

   }
    
  }
  
  public void newRect(){
    
   rects.add(new DragRect(50, 440, 110, 500)); // Create a DragRect object
    
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
        flag = flag || (rect.lineInter(xPad, voteMap,  xPad + 1 * chartWidth / 3.0, predMap) || 
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
        
        // count these
        
        
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
  
  
    void legend(){
    
      textSize(20);
      rectMode(CORNER);
      
      stroke(0);
      choosePartyFill("D");
      rect(width - xPad + 20 - 100, height - 85, 15, 15);
      choosePartyFill("R");
      rect(width - xPad + 20 - 100, height - 60, 15, 15);


      fill(0);
      stroke(0);
      text("democrats", width - 195, height - 70);
      text("republicans", width - 195, height - 45);

  }
  
  void title(){
    stroke(0);
    fill(0);
    
    textSize(25);
    
    text("Senate Voting Alignment with Trump by Senator and Party Affiliation", width / 2 - 375, height - 75);

    textSize(20);
    
    text(str(pyear) + "'th Senate", width / 2 - 45, height - 40);
      
    
  }
  
  void drawCon(){
    
    fill(40,40,40);
    stroke(0);
    
    strokeWeight(3);
    
    fill(255,255,255);
    circle(115, height - 50, 15);
    circle(115, height - 75, 15);

    //strokeWeight(2);
    fill(0);
    if(pyear == 116){
      circle(115, height - 50, 4);
    } else {
      circle(115, height - 75, 4);
    }
    strokeWeight(3);
    
        fill(0);
    stroke(0);
    textSize(20);
    text("115", 130, height - 70);
    text("116", 130, height - 45);

  }
  
  
  void important(){
  
  float best = 10000;
  
  TableRow bestRow = table.getRow(0);
  
  int bestIndex = 0;
    
  int k = 0;
  
  for (TableRow row : table.rows()) {
       
    
     int votes = int(row.getString("votes"));
     float voteMap = map(votes, 0, totalVotes, height - yPad, yPad);
     
     float pred = float(row.getString("predicted_agree"));
     float predMap = map(pred, 0, 1.0, height - yPad,yPad);
     
     float agree = float(row.getString("agree_pct"));
     float agreeMap = map(agree, 0, 1.0, height - yPad, yPad);

     float net = float(row.getString("net_trump_vote"));
     float netMap = map(net, -50.0, 50.0, height - yPad, yPad);
    
     String party = row.getString("party");     
     
     int i = 0;
     
     float a = distancePointToLine(mouseX, mouseY, xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
     i++;
     float b = distancePointToLine(mouseX, mouseY, xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
     i++;
     float c = distancePointToLine(mouseX, mouseY, xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
     
     float minDist = min(a,b,c);
        //    line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
        //i++;
        //line(xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
        //i++;
        //line(xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
     
     boolean flag = false;
    
    for (DragRect rect : rects) {
      flag = flag || (rect.lineInter(xPad, voteMap,  xPad + 1 * chartWidth / 3.0, predMap) || 
         rect.lineInter(xPad + 1 * chartWidth / 3.0, predMap, xPad + 2 * chartWidth / 3.0, agreeMap) || 
         rect.lineInter(xPad + 2 * chartWidth / 3.0, agreeMap, xPad + 3 * chartWidth / 3.0, netMap));
    }
           
    if(minDist < best && flag){
      
      bestRow = row;
      best = minDist;
      bestIndex = k;
    }
        
      //drawLine(row, true);
      k++;
    }
    
    
  println(best);
  if(best < 15){
    
    //TableRow row = bestRow;
    
    TableRow row = table.getRow(bestIndex);
       int votes = int(row.getString("votes"));
     float voteMap = map(votes, 0, totalVotes, height - yPad, yPad);
     
     float pred = float(row.getString("predicted_agree"));
     float predMap = map(pred, 0, 1.0, height - yPad,yPad);
     
     float agree = float(row.getString("agree_pct"));
     float agreeMap = map(agree, 0, 1.0, height - yPad, yPad);
    
     float net = float(row.getString("net_trump_vote"));
     float netMap = map(net, -50.0, 50.0, height - yPad, yPad);
     
        String name = row.getString("last_name");

        strokeWeight(4);
        stroke(255,20,255);
        int i = 0;
        line(xPad + i * chartWidth / 3, voteMap,  xPad + (i+1) * chartWidth / 3, predMap);
        i++;
        line(xPad + i * chartWidth / 3, predMap, xPad + (i+1) * chartWidth / 3, agreeMap);
        i++;
        line(xPad + i * chartWidth / 3, agreeMap, xPad + (i+1) * chartWidth / 3, netMap);
        
     text(name, 100, 700);
  }
}

}
  
  

  
int pButton(){
  if(mousePressed){
    if(dist(mouseX, mouseY, 115, height - 75) < 15){
      pyear = 115;
      return(1);
    }
  
    if(dist(mouseX, mouseY, 115, height - 50) < 15){
      pyear = 116;
      return(2);
    }
  }
  return(0);
}
  
