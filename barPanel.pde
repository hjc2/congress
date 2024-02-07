

void barInputs(){
  
   int tmp = bars.buttons();
   
   if(tmp != barMode && tmp != 0){
     
     barMode = tmp;
     
     barToData(barMode);
   }
   
}


void barToData(int x){
  switch(x){
    case 1:
      bars = new BarChart(youngTable);
      break;
    case 2:
      bars = new BarChart(oldTable);
      break;
    case 3:
      bars = new BarChart(youngDems);
      break;
    case 4:
      bars = new BarChart(youngRep);
      break;
    case 5:
      bars = new BarChart(oldDems);
      break;
    case 6:
      bars = new BarChart(oldRep);
      break;
  }
}

// 1, 115 and -75
