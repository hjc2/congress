

// THIS ASSIGNMENT WAS WRITTEN USING CHATGPT FOR SOME OF IT

Table table;

Table youngTable; // 1
Table oldTable; // 2

Table youngDems; // 3
Table youngRep; // 4

Table oldRep; // 5
Table oldDems; // 6

Table flip;

BarChart bars;

int party;
int year;

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

  youngDems = filterTableByParty(youngTable, "D");
  youngRep = filterTableByParty(youngTable, "R");
  
  oldRep = filterTableByParty(oldTable, "R");
  oldDems =  filterTableByParty(oldTable, "D");
    
  barToData(barModeY, barModeP);
  
 // ---- 
 
   bars = new BarChart(oldTable);
  
   pars = new ParChart(oldTable);
  
  flip = oldTable;
  
  heart = new Pulse(width - 90, height / 2 - 40);
 
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
  
   if(buttons() != 0){
     
     if(buttons() == 1){
          ParChart lars = new ParChart(oldTable);
          lars.rects = pars.rects;
          
          pars = lars;
     }
     if(buttons() == 2){
          ParChart lars = new ParChart(youngTable);
          lars.rects = pars.rects;
          
          pars = lars;       
     }
     
   }
     
  pars.update();
  pars.draw();
  
  
  stroke(0);
  fill(0);

  circle(50, height - 50, 15);
}

void mouseClicked() {
  //flip = (flip == oldTable) ? youngTable : oldTable;
  //pars = new ParChart(flip);
  
  if(dist(mouseX,mouseY,50, height - 50) < 15){
  
    //pars.ne
    
    pars.newRect();
  
  }
}
