float falling_time = 1.85;
import ddf.minim.*;
import ddf.minim.analysis.*;

void keyPressed()
{
  if(key == 'p' && state == -1)
  {
    state = 3;
    my_timer = 0.0;
    index = 0;
    song.rewind();
    song.play();
  }

  if(key == 'e' && state == 3){
    state = -1;
    minim.stop();
  }
}
