

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

Table table;
Table youngTable;
Table oldTable;

BarChart bars;

void setup(){
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  youngTable = filterTableByCongress(table, 115);
  oldTable = filterTableByCongress(table, 116);
  
  youngTable.sort("agree_pct");
  oldTable.sort("agree_pct");
  
  bars.xPad = BarChart(this.p, table);
  
  //println(bars.xPad);
  //bars = BarClass(oldTable);


}


void draw(){
  background(255);

  
  //BarClass bars =  BarClass(oldTable);
  
  
  //bars.draw();
  
}
