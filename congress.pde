

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT


Table table;
Table filteredTable;

void setup(){
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
  
  filteredTable = filterTableByCongress(table, 0);
  
  filteredTable.sort("agree_pct");

  //println(filteredTable.getRowCount());
  
  //filteredTable.print();
}


void draw(){
  
  background(255);

  //barChart(filteredTable);
  parallel(filteredTable);
}
