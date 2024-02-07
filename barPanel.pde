

void barInputs(){
  
   int tmp = bars.buttons();
   
   if(tmp != barModeY && tmp != 0){  
          
     barToData(barModeY, barModeP);

     barModeY = tmp;
   }
}


void barToData(int x, int y){
  
  
  if(x == 1 && y == 2){ bars = new BarChart(oldTable); return;}
  if(x == 2 && y == 2){ bars = new BarChart(youngTable); return;}
  
}



// 1, 115 and -75
