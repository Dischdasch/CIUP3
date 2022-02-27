import java.util.Random;
import processing.sound.*;
import gifAnimation.*;

GifMaker ficherogif;
//Plantes
PShape sun;
PShape planet1;
PShape planet2;
PShape planet3;
PShape planet4;
PShape planet5;

PShape moon2;
PShape moon22;

//Textures
PImage sunTex;
PImage yellowTex;
PImage moonTex;
PImage frozenTex;
PImage lavaTex;
PImage violetTex;
PImage greenTex;
PImage rainTex;

boolean stopped = false;
//Stars Position
int[] arrX = new int[70];
int[] arrY = new int[70];
//frameCount
int fC = 0;
//Information about planets
int infoIndex = 0;
String[] arrInfo = new String[]{"", "Buraf", "Terua", "Gasdo", "Helio", "Lava"};
String[] arrInfoG = new String[]{"", "3.12m/s^2", "3.52m/s^2", "4.38m/s^2", "4.90m/s^2", "5.73m/s^2"};
String[] arrInfoM = new String[]{"", "0", "0", "2", "0", "1"};
String[] arrInfoP = new String[]{"", "No", "Yes", "No", "No", "Yes"};

SoundFile  sound;

void setup(){
  size(1024, 768, P3D);
  background(15);
  
  //star positions
  Random rd = new Random();
  
  for (int i = 0; i < arrX.length; i++)
    arrX[i] = rd.nextInt(2425);
    
  for (int i = 0; i < arrY.length; i++)
    arrY[i] = rd.nextInt(2100);
  
  //get textures
  sunTex = loadImage("Sun.jpg");
  yellowTex = loadImage("Saturn.jpg");
  moonTex = loadImage("Moon.jpg");
  frozenTex = loadImage("frozenTex.jpg");
  lavaTex = loadImage("lavaTex.jpg");
  violetTex = loadImage("violetTex.jpg");
  greenTex = loadImage("greenTex.jpg");
  rainTex = loadImage("rainbow.jpg");
  
  //planet creation
  noStroke();
  sun = createShape(SPHERE, 150);
  sun.setTexture(sunTex);

  planet1 = createShape(SPHERE, 10);
  planet1.setTexture(greenTex);
  planet2 = createShape(SPHERE, 18);
  planet2.setTexture(yellowTex);
  planet3 = createShape(SPHERE, 22);
  planet3.setTexture(rainTex);
  planet4 = createShape(SPHERE, 25);
  planet4.setTexture(violetTex);
  planet5 = createShape(SPHERE, 35);
  planet5.setTexture(lavaTex);
  
  moon2 = createShape(SPHERE, 5);
  moon2.setTexture(moonTex);
  moon22 = createShape(SPHERE, 6);
  moon22.setTexture(frozenTex);
  
  //sound
  sound = new SoundFile(this, "SpaceLoop.wav");
  sound.loop();
  
  //gif
  ficherogif = new GifMaker(this, "animacion.gif");
  ficherogif.setRepeat(0);
}

void draw(){
  if(!stopped){
    //user has not paused
    fC = frameCount;
  }
  background(15);
  stroke(180);
  
  //create stars with random weight
  for(int i = 0; i<arrX.length; i++){
    strokeWeight(random(1,2));
    point(arrX[i]-700, arrY[i]-700, -1000);
  }

  //create planets, moons, and lighting
  pushMatrix();
  translate(width/2, height/2, -300); 
  pushMatrix();
  rotateY(PI * fC / 500);
  shape(sun);
  popMatrix();
  pointLight(255, 229, 156,  0,  0,  0);
  
  
  show(infoIndex);
  pushMatrix();
  rotateY(PI * fC / 300);
  translate(-50,  0,  230);

 if(infoIndex == 1){
  noLights();
  }
  shape(planet1, 0, 0);
  popMatrix();
   if(infoIndex == 1){
     noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  }
  
  pushMatrix();
  rotateY(PI * fC / 200);
  translate(0,  0,  290);
  if(infoIndex == 2){
  noLights();
  }
  shape(planet3);
  popMatrix();
  if(infoIndex == 2){
    noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  }
  
  pushMatrix();
  rotateY(PI * fC / 410);
  translate(200, 0, 310);
  if(infoIndex == 3){
  noLights();
  }
  shape(planet2); 
  
  
  //Moon1
  pushMatrix();
  rotateZ(PI * fC / 100);
  translate(19, 19, 0);
  shape(moon2);
  
  popMatrix();
  
  //Moon2
  pushMatrix();
  rotateY(PI/2 * fC / 70);
  translate(24, 0, 24);
  shape(moon22);
  popMatrix();
  
  popMatrix();
  if(infoIndex == 3){
     noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  }
  
  pushMatrix();
  rotateY(PI * fC / 390);
   translate(200,  0,  450);
   if(infoIndex == 4){
  noLights();
  }
  shape(planet4);
  popMatrix();
  if(infoIndex == 4){
     noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  }
   
  pushMatrix();
  rotateY(PI * fC / 480);
   translate(-50,  0,  590);
   if(infoIndex == 5){
  noLights();
  }
  shape(planet5);
  
  //Moon3
  pushMatrix();
  rotateZ(PI * fC / 200);
  translate(35, 35, 0);
  shape(moon2);
  popMatrix();
  
  popMatrix();
  if(infoIndex == 5){
     noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  }
  
  popMatrix();
  
  //Instructions
 textSize(20);
 noLights();
 fill(255);
 text("Press SPACE to Pause / Resume", 220, 750, 0);
 text("Press ENTER for Planet Details", 520, 750, 0);
  
  //gif
  ficherogif.addFrame();
}

void keyPressed(){
  if(key == ' '){
    //Pause or resume
    if (stopped == true){
    stopped = false;
    frameCount = fC;
    }
    else {
    stopped = true;
    fC = frameCount;
    }
  } //<>//
    if (keyCode == ENTER){ //<>//
      //select details index
      if(infoIndex <5){
        infoIndex +=1;
      }
      else{
        infoIndex = 0;
      } 
    }
}
//Give information about planets
void show(int index){
  noLights();
  fill(255);
  textSize(100);
  text(arrInfo[index], -630, -370, 0);
  textSize(30);
  if(index > 0){
  text("Gravitation: " + arrInfoG[index], -630, -320, 0);
  text("Moons: " + arrInfoM[index], -630, -290, 0);
  text("Populated: " + arrInfoP[index], -630, -260, 0);
  }
  noLights();
  pointLight(255, 229, 156,  0,  0,  0);
  
}

void mousePressed() {
  ficherogif.finish();          // Finaliza captura y salva
}
