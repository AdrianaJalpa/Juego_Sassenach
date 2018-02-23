import processing.sound.*;
SoundFile soundfile;


pathfinder[] paths;
int num;
static int count;

//arbol2
ArrayList<Blade> bush = new ArrayList<Blade>();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;

//particulas juego
ArrayList<Ball> floatBall;
int ballNum = 10;

PFont cursiva;
PFont normal;

int x,y;
int pantalla=0;
int turno=0;
int jugador1;
int jugador2;
int hp;

personaje p1;
personaje p2;
personaje p3;
personaje p4;
personaje p5;

personaje j1;
personaje j2;


void setup(){
  size(800,600);
  background(#9CE0A0);    //fondo default
  x=width/2;
  y=height/2;
  
  cursiva= createFont("ACaslonPro-Italic",20);
  normal= createFont("Calibri",20);
    
  p1= new personaje("Druida",150, 7, 0);
  p2= new personaje("Contemplador",150,6,1);
  p3= new personaje("Leviatan",150,7,2);
  p4= new personaje("Drider",150,5,3);
  p5= new personaje("Drow",150,4,4);
  
  soundfile = new SoundFile(this, "Track_VG.mp3");
  soundfile.loop();
  
  ellipseMode(CENTER);
  stroke(200, 0, 0, 200);
  smooth();
  num = 2;
  count = 0;
  paths = new pathfinder[num];
  for(int i = 0; i < num; i++) paths[i] = new pathfinder();
  
  //arbol2
  
  for (int i = 0; i < maxSize; i++) {
    bush.add(new Blade(random(40, 180)));//This is creating a blade with a random number of segments
  }
  
  //particulas juego
  floatBall = new ArrayList<Ball>();
  for (int i=0; i <ballNum; i++) {
    floatBall.add(new Ball());
  }
}


void draw(){
  
    
  switch(pantalla)
  {
    case 0:
      intro();
    break;
    
    case 1:
      historia();
    break;
    
    case 2:
      seleccion1();
    break;
    
    case 3:
      seleccion2();
    break;
    
    case 4:
      juego();
    break;
    
    case 5:
      fin();
    break;
  }
}

void intro()
{
    
 for (int i = 0; i < paths.length; i++) {
    PVector loc = paths[i].location;
    PVector lastLoc = paths[i].lastLocation;
    strokeWeight(paths[i].diameter);
    line(lastLoc.x, lastLoc.y, loc.x, loc.y);
    paths[i].update();
  }
  
   fill(255);
   textAlign(CENTER);
   textSize(50);
   text("Sassenach",600,100);    //titulo
   textSize(20);
   fill(255);
   text("Presione c para comenzar",600,130); 
   
   
   if(key=='c' || key=='C')
   {
     pantalla=1;
   }
}

void historia()
{
  
  background(#2AB493);
  
  pushMatrix();
  scale(1.3);
  translate(x-80,y-320);
  rama();
  popMatrix();
    
  pushMatrix();
  translate(x-400,y-400);
  fill(0);
  textFont(cursiva);
  textSize(23);
  textAlign(LEFT);
  text("\t En la edad de Hierro Germánica, \n en una Escandinavia mágica, \n existe un árbol el cual protege la magia \n de las Cinco Tierras...\n Este árbol es conocido como Sassenach. \n ",50,200);
  text("\t Con el transcurso del tiempo, \n el Sassenach ha perdido casi todo su poder \n y agoniza, y solo queda magia para una Tierra. \n Los jefes de cada clan se enfrentarán para obtener \n el resto de la magia que queda...",50,400);
  popMatrix();
  
  textFont(normal);
  text("Presiona s para continuar",500,550);
  
  if(key=='s' || key == 'S')
  {
    pantalla=2;
  }
}

void seleccion1(){
  
  background(#F3F5C3);
  
  pushMatrix();
  translate(x-330,y-230);
  p1.display();
  popMatrix();
  
  pushMatrix();
  translate(x-100,y-230);
  p2.display();
  popMatrix();
  
  pushMatrix();
  translate(x+120,y-230);
  p3.display();
  popMatrix();
  
  pushMatrix();
  translate(x-250,y);
  p4.display();
  popMatrix();
  
  pushMatrix();
  translate(x+20,y);
  p5.display();
  popMatrix();
  
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Jugador 1: Para elegir personaje presione la tecla correspondiente",400,50);
  
  fill(#4E5855);
  textSize(15);
  text("A. Druida",x-230,y);
  text("B.Contemplador",x,y);
  text("C.Leviatan",x+230,y);
  text("D.Drider",x-150,y+235);
  text("E.Drow",x+125,y+235);
  
  if(keyPressed){
      if(key== 'A' || key == 'a'){
        jugador1=0;
        j1=p1;
        pantalla=3;
      }
      
      if(key== 'B' || key == 'b'){
        jugador1=1;
        j1=p2;
        pantalla=3;      
      }
      
      if(key== 'C' || key == 'c'){
        jugador1=2;
        j1=p3;
        pantalla=3;      
      }
      
      if(key== 'D' || key == 'd'){
        jugador1=3;
        j1=p4;
        pantalla=3;      
      }
      
      if(key== 'E' || key == 'e'){
        jugador1=4;
        j1=p5;
        pantalla=3;      
      }
  }
}

void seleccion2(){
  
  background(#E1FAE4);
  
  pushMatrix();
  translate(x-330,y-230);
  p1.display();
  popMatrix();
  
  pushMatrix();
  translate(x-100,y-230);
  p2.display();
  popMatrix();
  
  pushMatrix();
  translate(x+120,y-230);
  p3.display();
  popMatrix();
  
  pushMatrix();
  translate(x-250,y);
  p4.display();
  popMatrix();
  
  pushMatrix();
  translate(x+20,y);
  p5.display();
  popMatrix();
  
  fill(0);
  textSize(20);
  text("Jugador 2: Para elegir personaje presione la tecla correspondiente",400,50);
  
  fill(#4E5855);
  textSize(15);
  text("F. Druida",x-230,y);
  text("G.Contemplador",x,y);
  text("H.Leviatan",x+230,y);
  text("I.Drider",x-150,y+235);
  text("J.Drow",x+125,y+235);
  
  if(keyPressed){
      if(key== 'F' || key == 'f'){
        jugador2=0;
        j2 = p1;
        pantalla=4;
      }
      
      if(key== 'g' || key == 'G'){
        jugador2=1;
        j2= p2;
        pantalla=4;      
      }
      
      if(key== 'H' || key == 'h'){
        jugador2=2;
        j2= p3;
        pantalla=4;      
      }
      
      if(key== 'I' || key == 'i'){
        jugador2=3;
        j2=p4;
        pantalla=4;      
      }
      
      if(key== 'j' || key == 'J'){
        jugador2=4;
        j2=p5;
        pantalla=4;      
      }
  }
}

void juego(){
  
  background(#F1F5DA);
  
  //particulas juego
  if (floatBall.get(floatBall.size()-1).alpha ==230) {
    for (int i = 0; i <ballNum; i++) {
      floatBall.add(new Ball());
    }
  }
  if (floatBall.get(0).alpha < 0) {
    for (int i = 0; i < ballNum; i++) {
      floatBall.remove(0);
    }
  }
  for (int i = 0; i<floatBall.size(); i++) {
    Ball b1 = floatBall.get(i);
    b1.update();
    b1.drawball();
    b1.bounce();
  }
  
  
  
  if(jugador1 == 0){
    pushMatrix();
    scale(1.2);
    translate(x-350,y-200);
    p1.display();
    popMatrix();
    
    p1.barra();
  }
  
  if(jugador1 ==1){
    pushMatrix();
    scale(1.2);
    translate(x-350,y-200);
    p2.display();
    popMatrix();
    
    p2.barra();
  }
  
  if(jugador1 == 2){
    pushMatrix();
    scale(1.2);
    translate(x-350,y-200);
    p3.display();
    popMatrix();
    
    p3.barra();
  }
  
  if(jugador1 == 3){
    pushMatrix();
    scale(1.2);
    translate(x-350,y-200);
    p4.display();
    popMatrix();
    
    p4.barra();
  }
  
  if(jugador1 == 4){
    pushMatrix();
    scale(1.2);
    translate(x-350,y-200);
    p5.display();
    popMatrix();
    
    p5.barra();
  }
  
  /************************* jugador 2******************************* */
  
  if(jugador2 == 0){
    pushMatrix();
    scale(1.2);
    translate(x,y-200);
    p1.display();
    popMatrix();
    
    p1.barra1();
  }
  
  if(jugador2 == 1){
    pushMatrix();
    scale(1.2);
    translate(x,y-200);
    p2.display();
    popMatrix();
    
    p2.barra1();
  }
  
  if(jugador2 == 2){
    pushMatrix();
    scale(1.2);
    translate(x,y-200);
    p3.display();
    popMatrix();
    
    p3.barra1();
  }
  
  if(jugador2 == 3){
    pushMatrix();
    scale(1.2);
    translate(x,y-200);
    p4.display();
    popMatrix();
    
    p4.barra1();
  }
  
  if(jugador2 == 4){
    pushMatrix();
    scale(1.2);
    translate(x,y-200);
    p5.display();
    popMatrix();
    
    p5.barra1();
  } 
  
  fill(#0F6C43);
  textSize(20);
  text("Jugador 1: Ataca con 'p'",x-200,y+100);
  text("Jugador 2: Ataca con 'x'",x+200,y+100);
  
  if(turno==0){
    j1.pelea();
  }
  
  else{
    j2.pelea1();
  }
}

void fin()
{
  //arbol2
  background(backgroundColor);
  fill(fillColor);
  for(int i = 0; i < bush.size(); i++){
    Blade b = (Blade) bush.get(i);
    b.drw();
  }
   
  if(j1.vida<=0){
    textAlign(CENTER);
    textSize(30);
    text("HAS GANADO JUGADOR 1",400,150);
    textSize(20);
    text("Has salvado tu Tierra",400,200);
  }
  
  if(j2.vida<=0){
    textSize(30);
    text("HAS GANADO JUGADOR 2",400,150);
    textSize(20);
    text("Has salvado tu Tierra",400,200);
  }
  
  textSize(15);
  text("presiona r para regresar",680,550);
  if(keyPressed){
    if(key=='r' || key=='R'){
      pantalla=2;
      if(pantalla==2){
        j1.vida=150;
        j2.vida=150;
      }
    }
  }
}


class personaje{
  String nombre;
  int vida;
  int ataque;
  int tipo;
  
  personaje(String nombre_, int vida_, int ataque_, int tipo_)
  {
    nombre= nombre_;
    vida=vida_;
    ataque=ataque_;
    tipo=tipo_;
  }
  
  void display()
  {
    switch(tipo)
    {
    case 0:
      personaje1();
    break;
    
    case 1:
      personaje2();
    break;
    
    case 2:
      personaje3();
     break;
     
     case 3:
       personaje4();
     break;
     
     case 4: 
       personaje5();
     break;
  }
  }
  
  
void barra(){
  fill(#980202);
  rect(100,100,150,20);
  
  fill(#0CCB47);
  rect(100,100,hp,20); 
  hp=j1.vida;

}

void barra1(){
  fill(#980202);
  rect(550,100,150,20);
  
  fill(#0CCB47);
  rect(550,100,hp,20);  
  hp=j2.vida;
}

void pelea(){
    if(keyPressed){
      if(key == 'x' || key == 'X'){
        j2.vida -= j1.ataque;
        turno=1;
      }
    }
      
  if(j2.vida<=0){
    pantalla=5;
    //gana jugador 1
  }
}
  
  void pelea1(){
    if(keyPressed){
      if(key == 'p' || key == 'P'){
        j1.vida -= j2.ataque;
        turno=0;
      }
    }
    if(j1.vida<=0){
      pantalla=5;
    }
  }
  
}


 class pathfinder {
  PVector lastLocation;
  PVector location;
  PVector velocity;
  float diameter;
  boolean isFinished;
  
  pathfinder() {
    location = new PVector(width/2, height);
    lastLocation = new PVector(location.x, location.y);
    velocity = new PVector(0, -10);
    diameter = random(10, 20);
    isFinished = false;
  }
  
   pathfinder(pathfinder parent) {
    location = parent.location.get();
    lastLocation = parent.lastLocation.get();
    velocity = parent.velocity.get();
    diameter = parent.diameter * 0.62;
    isFinished = parent.isFinished;
    parent.diameter = diameter;
  }
  
 void update() {
    
    if(location.x > -10 & location.x < width + 10 & location.y > -10 & location.y < height + 10) {
      lastLocation.set(location.x, location.y);
      if (diameter > 0.2) {
        count ++;
        PVector bump = new PVector(random(-1, 1), random(-1, 1));
        velocity.normalize();
        bump.mult(0.2);
        velocity.mult(0.8);
        velocity.add(bump);
        velocity.mult(random(5, 10));
        location.add(velocity);
        if (random(0, 1) < 0.2) { // control length
          paths = (pathfinder[]) append(paths, new pathfinder(this));
        }
      } 
      else {
        if(!isFinished) {
          isFinished = true;
          noStroke();
          fill(240, 230, 150, 100);
          ellipse(location.x, location.y, 10, 10);
          stroke(200, 0, 0, 200);
        }
      }
    }
  }
}

class Blade {
  float segments, angle, num;
  
  Blade(float segments) {
    this.segments = segments;
    angle = random(-20, 20);//Sets a random angle for the blade
  }

  void drw(){
    pushMatrix();
    translate(x-200, y+350);
    branch(segments);
    popMatrix();
  }
  
  //This gets called repeatedly to draw all the segments of branch
  void branch(float len) {
    len *= 0.75;
    
    float t = map(len, 1, maxSize, 1, 5);
    float c = angle+sin(len+num) * 5;
    strokeWeight(t);
    
    /* Draw the line first then overlap the joints with white cirlces. */
    line(0, 0, 0, -len);
    ellipse(0, 0, t, t);
    
    /* We make the next location and if len > 5 then we make a new segment to our branch */
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(c));
      /* A function that calls itself with the same parameters. */
      branch(len);
      popMatrix();
    }
    num+=0.001;
  }
}

//particulas juego
class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  int w, h,alpha;

  Ball() {
    pos = new PVector(400, 500);
    //vel = new PVector(1, -1);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    w = 30;
    h = 30;
    alpha =255;
  }

  void update() {
    acc.x = random(-0.13, 0.13);
    acc.y = random(-0.13, 0.13);
    vel.add(acc);
    pos.add(vel);
    //alpha = int(alpha - 0.5);
    alpha--;
  }

  void drawball() {
    noStroke();
    //stroke(255,alpha);
    fill(173,255, 173,alpha);
    ellipse(pos.x, pos.y, w, h);
  }
  void bounce() {
    if (pos.x>width || pos.x<0) {
      vel.x *= -1;
    }
    if (pos.y>height || pos.y<0) {
      vel.y *= -1;
    }
  }
}