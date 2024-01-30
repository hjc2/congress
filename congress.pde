

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

enum Status {
  SHRINK, EXPAND, YOUNG, OLD
}

enum Mode {
  BAR,
  PAR
}

Table table;
Table youngTable;
Table oldTable;

float magnit = 1;

Status status = Status.YOUNG;
Mode mode = Mode.BAR;

int century = 116;

void setup(){
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  youngTable = filterTableByCongress(table, 115);
  oldTable = filterTableByCongress(table, 116);
  
  youngTable.sort("agree_pct");
  oldTable.sort("agree_pct");
}


void draw(){
    
  background(255);

  
  parallel(oldTable);
  //if(mode == Mode.BAR){
  //    barChart(youngTable);
  //} else {
  //    //parallel(youngTable);
  //    barChart(oldTable);
  //}
}

void mouseClicked(){
    //status = status == Status.YOUNG ? Status.OLD : Status.YOUNG;
    //status = status == Status.EXPAND ? Status.SHRINK : Status.EXPAND;
  
    mode = mode == Mode.BAR ? Mode.PAR : Mode.BAR;

}
// 102 - 116 vs 105 - 115


void eventHandler(){
  
  
}
