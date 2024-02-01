

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

Table table;
Table youngTable;
Table oldTable;
Table youngDems;

//DragCircle c;

BarChart bars;

void setup(){
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  youngTable = filterTableByCongress(table, 115);
  oldTable = filterTableByCongress(table, 116);
  
  youngTable.sort("agree_pct");
  oldTable.sort("agree_pct");
  
  youngDems = filterTableByParty(youngTable, "D");
  
  
    
  bars = new BarChart(youngDems);
  
  //println(bars.xPad);
  //bars = BarClass(oldTable);


}


void draw(){
  background(255);

  
  bars = new BarChart(oldTable);
  
  
  bars.draw();
  
}
