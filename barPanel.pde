

int buttons(){
  if(mousePressed){
    if(dist(mouseX, mouseY, 115, height - 75) < 15){
      year = 115;
      return(1);
    }
  
    if(dist(mouseX, mouseY, 115, height - 50) < 15){
      year = 116;
      return(2);
    }
  }
  return(0);
}

int pb(){
  if(mousePressed){
    if(dist(mouseX, mouseY, 300, height - 62) < 20){
      return(1);
    } else if(dist(mouseX, mouseY, 330, height - 62) < 20){
      return(2);
    } else if(dist(mouseX, mouseY, 360, height - 62) < 20){
      return(3);
    }
  }
  
  return(0);
  
}
  
  
void barInputs(){
  
   int tmp = buttons();
   
   int rmp = pb();
   
   boolean flag = false;
   
   if(tmp != barModeY && tmp != 0){  
     barModeY = tmp;
    barToData(barModeY, barModeP);
   }
   if(rmp != barModeP && rmp != 0){
     barModeP = rmp;
    barToData(barModeY, barModeP);
   }
}



void barToData(int x, int y){
 
  
  if(x == 1 && y == 2){ bars = new BarChart(oldTable); return;}
  if(x == 2 && y == 2){ bars = new BarChart(youngTable); return;}
  
  if(x == 1 && y == 1){ bars = new BarChart(oldDems); return;}
  if(x == 2 && y == 1){ bars = new BarChart(youngDems); return;}
  
  if(x == 1 && y == 3){ bars = new BarChart(oldRep); return;}
  if(x == 2 && y == 3){ bars = new BarChart(youngRep); return;}
  
  
}



// 1, 115 and -75
