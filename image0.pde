import gab.opencv.*;
import processing.video.*;

PImage src;
OpenCV opencv;
Capture video;

void setup_image()
{
  PImage photo1 = loadImage("GuiltyKiss.jpg");
  image(photo1,0,0,480,640);
  
  /*video = new Capture(this, 640, 480);
  video.start();

  colorMode(RGB, 255, 255, 255, 100);
  opencv = new OpenCV(this, 640, 480);*/
}

void draw_image_processing()
{
  /*if (video.available()) {
  video.read();
  }

 // Load the new frame of our camera in to OpenCV
  opencv.loadImage(video);
  opencv.useColor();

  if(keyPressed)
  {
    src = opencv.getSnapshot();
    image(src, 0, 0, src.width/2, src.height/2);
  }*/
}
