

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
    
  bars = new BarChart(youngTable);

}


void draw(){
  background(255);  
    
  bars.draw();
  
  barInputs();
  
  //line(width / 2, 0, width / 2, height);
  //  line(width / 2, 0, width / 2 + 25, height);
  //  line(width / 2, 0, width / 2 - 25, height);

}
