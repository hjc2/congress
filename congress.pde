

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

Table table;

Table youngTable; // 1
Table oldTable; // 2

Table youngDems; // 3
Table youngRep; // 4

Table oldRep; // 5
Table oldDems; // 6

Table oldFair;
Table youngFair;

Table flip;

BarChart bars;

int party;
int byear;
int pyear;

int barModeP;
int barModeY;

Pulse heart;

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
  
  oldFair = filterTableByCongress(table, 115);
  youngFair = filterTableByCongress(table, 116);
  
  oldFair.sort("last_name");
  youngFair.sort("last_name");

  youngDems = filterTableByParty(youngTable, "D");
  youngRep = filterTableByParty(youngTable, "R");
  
  oldRep = filterTableByParty(oldTable, "R");
  oldDems =  filterTableByParty(oldTable, "D");
    
  barToData(barModeY, barModeP);
  
 // ---- 
 
   bars = new BarChart(oldTable);
  
   pars = new ParChart(oldTable);
  
  
  heart = new Pulse(width - 90, height / 2 - 40);
  
  byear = 115;
  pyear = 115;
  
  
  pars.newRect();
 
}



void draw(){
  background(255);  
  
  heart.update();
  if(heart.state == 1){
    barBeat();
  } else if(heart.state == 2){
    parBeat();
  } else {
    println("ERROR - state not found");
  }
  heart.draw();

}


void barBeat(){
    
  barInputs();
  
  bars.draw();
}

void parBeat(){
   
   if(pButton() != 0){
     
     if(pButton() == 1){
          ParChart lars = new ParChart(oldFair);
          lars.rects = pars.rects;
          
          pars = lars;
     }
     if(pButton() == 2){
          ParChart lars = new ParChart(youngFair);
          lars.rects = pars.rects;
          
          pars = lars;       
     }
     
   }
     
  pars.update();
  pars.draw();
}
