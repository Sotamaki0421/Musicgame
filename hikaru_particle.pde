final int MAX_PARTICLE = 30;
hikaru_Particle[] hikaru_p = new hikaru_Particle[MAX_PARTICLE];

final int LIGHT_FORCE_RATIO = 5;
final int LIGHT_DISTANCE = 75 * 75;
final int BORDER = 75;

float baseRed,baseGreen,baseBlue;
float baseRedAdd,baseGreenAdd,baseBlueAdd;
final float RED_ADD = 1.2;
final float GREEN_ADD = 1.7;
final float BLUE_ADD = 2.3;

int hikaru_able = 0;
float hikaru_timer = 0.0;

void setup_hikaru_particles(){
  for(int i = 0;i < MAX_PARTICLE;i++){
    hikaru_p[i] = new hikaru_Particle();
  }
  baseRed = 0;
  baseRedAdd = RED_ADD;
  
  baseGreen = 0;
  baseGreenAdd = GREEN_ADD;
  
  baseBlue = 0;
  baseBlueAdd = BLUE_ADD;
  
  hikaru_able = 0;
}
  
void draw_hikaru_particles(){
  
  baseRed += baseRedAdd;
  baseGreen += baseGreenAdd;
  baseBlue += baseBlueAdd;
  
  colorOutCheck();
  
  for(int pid = 0;pid < MAX_PARTICLE;pid++){
    hikaru_p[pid].move(cxx,cyy);  
  }
  
  int tRed = (int)baseRed;
  int tGreen = (int)baseGreen;
  int tBlue = (int)baseBlue;
  
  tRed *= tRed;
  tGreen *= tGreen;
  tBlue *= tBlue;
  
  loadPixels();
  for(int pid = 0;pid < MAX_PARTICLE;pid++){
    int left = max(0,hikaru_p[pid].x - BORDER);
    int right = min(width,hikaru_p[pid].x + BORDER);
    int top = max(0,hikaru_p[pid].y - BORDER);
    int bottom = min(height,hikaru_p[pid].y + BORDER);
    
    for (int y = top;y < bottom;y++){
      for(int x = left;x<right;x++){
        int pixelIndex = x + y * width;
        
        int r = pixels[pixelIndex] >> 16 & 0xFF;
        int g = pixels[pixelIndex] >> 8 & 0xFF;
        int b = pixels[pixelIndex] & 0xFF;
        
        int dx = x - hikaru_p[pid].x;
        int dy = y - hikaru_p[pid].y;
        int distance = (dx * dx) + (dy * dy);
        
        if(distance < LIGHT_DISTANCE){
          int fixFistance = distance * LIGHT_FORCE_RATIO;
          
          if (fixFistance == 0){
            fixFistance = 1;
          }
          r = r + tRed/ fixFistance;
          g = g + tGreen/fixFistance;
          b = b + tBlue/fixFistance;
        }
        
        pixels[x + y * width] = color(r,g,b);
      }
    }
  }
  updatePixels();
}

void colorOutCheck(){
  if(baseRed < 10){
    baseRed = 10;
    baseRedAdd *= -1;
  }
  else if (baseRed > 255){
    baseRed = 255;
    baseRedAdd *= -1;
  }
  if(baseBlue < 10){
    baseBlue = 10;
    baseBlueAdd *= -1;
  }
  else if(baseBlue > 255){
    baseBlue = 255;
    baseBlueAdd *= -1;
  }
  if(baseGreen < 10){
    baseGreen = 10;
    baseGreenAdd *= 1;
  }
  else if(baseGreen > 255){
    baseGreen = 255;
    baseGreenAdd *= 1;
  }
}


class hikaru_Particle{
  int x,y;
  float vx,vy;
  float slowLevel;
  final float DECEL_RATIO = 0.95;
  
  hikaru_Particle() {
    x = (int)random(width);
    y = (int)random(height);
    slowLevel = random(100) + 5;
  }

  void move(float targetX,float targetY){
    x = (int)(targetX + 5.0*vx*(my_timer -hikaru_timer));
    y = (int)(targetY + 5.0*vy*(my_timer -hikaru_timer));
  }

  void explode(){
    vx = random(100)-50;
    vy = random(100)-50;
    slowLevel = random(100)+5;
  }
}
