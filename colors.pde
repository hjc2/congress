

void choosePartyFill(String s){
  
  switch(s){
    
    case "D":
    case "Democrat":
       fill(30,30,255);
       break;
    case "R":
    case "Republican":
       fill(255,30,30);
       break;
    default:
       fill(120);
       break;
  }
}


void choosePartyStroke(String s){
  
  switch(s){
    
    case "D":
    case "Democrat":
       stroke(30,30,255);
       break;
    case "R":
    case "Republican":
       stroke(255,30,30);
       break;
    default:
       stroke(120);
       break;
  }
}
