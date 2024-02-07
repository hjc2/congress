

void barInputs(){
  
   int tmp = bars.buttons();
   
   int rmp = bars.pb();
   
   boolean flag = false;
   
   if(tmp != barModeY && tmp != 0){  
     barModeY = tmp;
     flag = true;
   }
   if(rmp != barModeP && rmp != 0){
     barModeP = rmp;
     flag = true;
   }
   
   if(flag){barToData(barModeY, barModeP);}
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
