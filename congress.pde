

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

enum Status {
  SHRINK, EXPAND, YOUNG, OLD
}

Table table;
Table youngTable;
Table oldTable;

float magnit = 1;

Status status = Status.YOUNG;

int century = 116;

void setup(){
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  youngTable = filterTableByCongress(table, 115);
  oldTable = filterTableByCongress(table, 116);
  
  youngTable.sort("agree_pct");
  oldTable.sort("agree_pct");
  
  //filteredTable.sort("agree_pct");

  //println(filteredTable.getRowCount());
}


void draw(){
    
  background(255);
  
  //if(status == Status.YOUNG){
  //    barChart(youngTable);
  //}
  //if(status == Status.OLD){
  //    barChart(oldTable);
  //}
  
  
  
  if(status == Status.EXPAND){
    
    shrink(youngTable);
    magnit += 1;
  } else {
    barChart(youngTable);
  }
  
  println(magnit);
}

void mouseClicked(){
    //status = status == Status.YOUNG ? Status.OLD : Status.YOUNG;
    status = status == Status.EXPAND ? Status.SHRINK : Status.EXPAND;

}
// 102 - 116 vs 105 - 115
