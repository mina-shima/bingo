import controlP5.*;

ControlP5 cp5;
Button BingoBtn;
Textarea displayTextarea;
int count=0;
int num;
int[] memo=new int[75];

void setup(){
  size(800,600);
  background(255,255,255);
  cp5=new ControlP5(this);
  
  PFont font=createFont("arial",30);
  textFont(font);
  
  BingoBtn=cp5.addButton("BINGO");
  BingoBtn.setPosition(400,300);
  BingoBtn.setSize(200,120);
  BingoBtn.setFont(font);
  BingoBtn.setId(10);
  
  displayTextarea=cp5.addTextarea("Data");
  displayTextarea.setPosition(0,0);
  displayTextarea.setSize(300,600);
  displayTextarea.setColorBackground(color(0,0,0));
  displayTextarea.setColorForeground(color(255,255,255));
  displayTextarea.setFont(font);
}

void draw(){
}

void displayWithoutSameNumber(){ //重複なしバージョン
  //配列に入れていって重複を調べる。重複ないときのみ追加する
  int i=0;
  memo[0]=int(random(1,75));
  num=int(random(1,75));
  while(memo[i]!=num){
    i++;
    if(i==count+1){
      displayTextarea.append(str(num)+'\n');
      memo[i]=num;
      count++;
    }
  }
}

void display(){ //重複ありバージョン
  int num;
  num=int(random(1,75));
  displayTextarea.append(str(num)+'\n');
}

void controlEvent(ControlEvent theEvent){
  if(theEvent.getId()==10){
    displayWithoutSameNumber();
  }
}
