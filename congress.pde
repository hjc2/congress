

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

int barModeP;
int barModeY;


DragRect dr;
ParChart pars;



void setup(){
  
  barModeY = 1;
  barModeP = 2;
  
  size(1200,800);
  
  table = loadTable("congress.csv", "header");
    
  oldTable = filterTableByCongress(table, 115);
  youngTable = filterTableByCongress(table, 116);

  oldTable.sort("agree_pct");
  youngTable.sort("agree_pct");

  youngDems = filterTableByParty(youngTable, "D");
  youngRep = filterTableByParty(youngTable, "R");
  
  oldRep = filterTableByParty(oldTable, "R");
  oldDems =  filterTableByParty(oldTable, "D");
    
  barToData(barModeY, barModeP);
  
 // ---- 
 
   dr = new DragRect(this, 400, 400, 600, 600); // Create a DragRect object

   pars = new ParChart(oldTable);

 
}



void draw(){
  background(255);  
    
  //barInputs();

  //bars.draw();
  
  
  ////parallel(youngTable);
  //dr.update();

  //dr.display();
  
  pars.draw();
  
}
