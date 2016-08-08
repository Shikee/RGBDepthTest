// Daniel Shiffman
// All features test

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
KinectTracker tracker;

float deg;
int i = 0;
int z =0;
int per=0;
boolean ir = false;
boolean colorDepth = false;
boolean mirror = false;
PImage bg;
void setup() {
  size(640, 745);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
    tracker = new KinectTracker();

  //kinect.enableIR(ir);
  kinect.enableColorDepth(colorDepth);
  kinect.enableMirror(!mirror);
  deg = kinect.getTilt();

  
  
  bg= loadImage("background3.jpg");
  // kinect.tilt(deg);
}


void draw() {
  background(bg);
  image(kinect.getVideoImage(), 80, 150,500,400);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
 // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);
  color c = get(130, 264); 
  if (c == color(150, 50, 50)) {
    i++;
    per = 100;
  }
  if(i%60 == 2) {z++; per = 0;}
 // println(hex(c));
  println(mouseX,mouseY); 
  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  // Display some info
  int t = tracker.getThreshold();
  color j = get(255,383);   
  color jj = get(206,350);    
  color jjj = get(177,309);    
  color jjjj= get(130,264);
  if(j==color(150, 50, 50))per = 25;
  if(jj==color(150, 50, 50))per = 50;
  if(jjj==color(150, 50, 50))per = 75;
  if(jjjj==color(150, 50, 50))per = 100;


  
  fill(0);
  //image(kinect.getDepthImage(), 0, 0);
  stroke(53, 242, 36);
  strokeWeight(10);
  smooth();
  textSize(26);
  text(z, 100,685);
  fill(#FFFFFF);
  text(per, 295,123);

  ellipse(100, 250, 30, 30);
  ellipse(580, 250, 30, 30);
  //line(340, 200, 340, 500);
  line(340, 250, 100, 250);  
  line(340, 250, 580, 250); 
  stroke(3,9,156);
  line(340,160,340,500);
  line(200,200,480,200);
 // text( , 10, 515);
}

