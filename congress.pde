

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
DragCircle circ;

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
  
  //circ = new DragCircle(this, width/2, height/2, 50);
  circ = new DragCircle(this, width/2, width / 2, 50);

}


void draw(){
  
  


  background(255);

  
  parallel(oldTable);
  
  circ.update();
  circ.display();
  
  //barChart(youngTable);
  
}
