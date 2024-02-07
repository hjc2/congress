

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

Table table;

Table youngTable; // 1
Table oldTable; // 2

Table youngDems; // 3
Table youngRep; // 4

Table oldRep; // 5
Table oldDems; // 6

BarChart bars;

int party;
int year;

int barMode;



void setup(){
  
  barMode = 1;
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  youngTable = filterTableByCongress(table, 115);
  oldTable = filterTableByCongress(table, 116);
  
  youngTable.sort("agree_pct");
  oldTable.sort("agree_pct");
  
  youngDems = filterTableByParty(youngTable, "D");
  youngRep = filterTableByParty(youngTable, "R");
  
  oldRep = filterTableByParty(oldTable, "R");
  oldDems =  filterTableByParty(oldTable, "D");
  
  panel = new CircleRectangle(this, 150, height - 50, 15, 80, 30, 4);
  
  bars = new BarChart(youngTable);

}


void draw(){
  background(255);  
    
  bars.draw();
  
  barInputs();
  
  
}


void barInputs(){
  
   int tmp = bars.buttons();
   
   if(tmp != barMode && tmp != 0){
     
     barMode = tmp;
     
     barToData(barMode);
   }
   
   // else do nothing
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
