int illusion = 0;
int value = 0;
int start = 0;
int end = 800;
int square = 50;
int endv = 600;
int interval = 40;
int time;
int y = 0;
int a = 80;
int b = 40;
int c = 100;
int d = 400;
int init = 0;
boolean active;
boolean interm;


void setup() {
  size(800, 600);
  background(255);
  time = millis();
}

void draw(){
  if (illusion == 0){
    background(255);
    if (active){
      linea();
    }else{
      cuadros();
      linea();
    } 
  }
  if (illusion == 1){
    background(0); 
    if (active){
      puntos();
    }else{
      lineas();
      puntos();
    }
  }
  if (illusion == 2){
    background(158);
    figures();
    if(active){
      if(millis()-time > interval){
        if(interm){
          interm = !interm;
          stroke(255);
          strokeWeight(4);
          noFill();
          ellipse(200, 400, 150,150);
          ellipse(500, 400, 150,150);
        }else{
          interm = !interm;
          pushStyle();
          noStroke();
          noFill();
          ellipse(200, 400, 150,150);
          ellipse(500, 400, 150,150);
          popStyle();
        }
      }
    }
  }
  if (illusion == 3){
    background(255);
    cuadrados();
    lineasb();
    movb();
  }
  if (illusion == 4){
    frameRate(10);
    background(145);
    if(active){
      figuresb();
      mov();
    }else{
      figuresb();
    }
  }
  if (illusion == 5){
    frameRate(40);
    background(0);
    if(active){
      figure();
      move();
    }else{
      figure();
    }    
  }
}

void linea(){
    for (int i = start; i < end; i += 50) {
    stroke(153);
    line(start,i,end,i);
  }
}

void cuadros(){
  for (int i = start; i < end; i += 100){
    for (int j = start; j < end; j += 200){
      fill(value);
      rect(i,j,square,square);
    }
  }
  for (int i = 25; i < end; i += 100){
    for (int j = 50; j < end; j += 100){
      fill(value);
      rect(i,j,square,square);
    }
  }
  for (int i = 50; i < end; i += 100){
    for (int j = 100; j < end; j += 200){
      fill(value);
      rect(i,j,square,square);
    }
  }
}

void puntos(){
  stroke(255);
  strokeWeight(15);
  for (int i = 100; i < end; i += 100){
    for (int j = 100; j < endv; j += 100){
      point(i,j);
    }
  }
}

void lineas(){
  stroke(208);
  strokeWeight(10);
  for (int i = 100; i < end; i += 100){
    line(i,start,i,end);
  }
  for (int i = 100; i < endv; i += 100){
    line(start,i,end,i);
  }
}

void figures(){
  strokeWeight(3);
  stroke(125);
  line(200,400,300,180);
  noFill();
  triangle(380,400,450,250,500,400);
  triangle(380,400,450,250,500,400);
  triangle(380,400,450,250,270,250);
  line(300,180,340,180);
  line(450,250,470,220);
  line(460,220,490,220);
  stroke(0);
  strokeWeight(10);
  point(370,340);
  noStroke();
  fill(176);
  ellipse(200, 400, 150,150);
  ellipse(500, 400, 150,150);
}

void figuresb(){
  noStroke();
  fill(255,128,020);
  rect(0,0,400,400);
  stroke(0);
  strokeWeight(15);
  line(400,0,400,400);
  line(0,400,400,400); 
  stroke(0);
  strokeWeight(30);
  point(600,450);
}

void mov(){
  noStroke();
  fill(145);
  rect(0,y,393,80);
  if ( y > 250){
    y = 50;
  }else{
    y += 40;
  }
}

void lineasb(){
  rectMode(CORNER);
  noStroke();
  fill(0);
  for (int y=0; y<300; y=y+40) {
    rect(0, y, 800, 20);
  }
}

void cuadrados(){
  fill(75,0,130);
  rect(320, b, a, a);
  rect(640, b, a, a);
  fill(173,255,47);
  rect(160, b, a, a);
  rect(480, b, a, a);
}

void movb(){
  if (b >= height-a/2) {
    start = 1;
  }
  if (b == a/2) {
    start = 0;
  }
  if (start == 0) {
    b++;
  }
  else {
    b--;
  }
}

void figure(){
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(250, 250, 150, 150);
  noStroke();
  fill(100);
  ellipse(c, 250, 100, 100);
  ellipse(250, c, 100, 100);
  ellipse(d, 250, 100, 100);
  ellipse(250, d, 100, 100);
  fill(210);
  ellipse(c+190, 250, 20, 20);
  ellipse(250, c+190, 20, 20);
  ellipse(d-190, 250, 20, 20);
  ellipse(250, d-190, 20, 20);
}

void move(){
  if (c>=165) {
    init=1;
  }
  if (c==100) {
    init=0;
  }
  if (init==0) {
    c++;
    d--;
  }
  else {
    c--;
    d++;
  }
}


void keyPressed(){
  if(key == 'a'){
    active = !active;
  }
  if(key == ' '){
    illusion += 1;
  }
}