import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

float bww;
float bhh;
float eRadius = 20;

void setup_music()
{
  minim = new Minim(this);
  song = minim.loadFile("Guilty Eyes Fever.wav");
  //song = minim.loadFile("marcus_kellis_theme.mp3", 1024);
  //song = minim.loadFile("eine.mp3", 1024);
  //song = minim.loadFile("Beautiful_Woman.mp3");//Densitosi.mp3");
  //beat = new BeatDetect();
 rectMode(CENTER);
  bww = box_w;
  bhh = box_h;
}
