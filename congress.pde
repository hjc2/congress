

Table table;
Table filteredTable;

void setup(){
  
  size(800,800);
  
  table = loadTable("congress.csv", "header");
  
  filteredTable = filterTableByCongress(table, 115);
  
  println(filteredTable.getRowCount());
  
  filteredTable.print();
}


void draw(){
  
  background(255);
  stroke(0);
  strokeWeight(1);
  fill(0);
    

  //barChart(filteredTable);
  
}
