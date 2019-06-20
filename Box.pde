float ts;
float ts2;
float ts3;
float cxx,cyy;
int sum = 0;

class Box {
  Body body;
 // Constructor
  Box(float x, float y) {
 // Add the box to the box2d world
    makeBody(new Vec2(x,y), box_w, box_h);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
 //pos.y is the box current positon
    if (pos.y > height + box_h) {
      ts3 = 48;
      textSize(ts3);
      text("MISS", width/2 ,height/2);
      killBody();
      return true;
    }
    return false;
  }
 
  boolean compare() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
 //pos.y is the box current positon
    /*if(abs(pos.y - goal_y) < box_h){
      if (pos.x == goal_x[0] && keyPressed && key == 'd')
      {
        judge(pos.x,pos.y);
        return true;
      }
      if (pos.x == goal_x[1]  && keyPressed && key == 'f')
      {
        judge(pos.x,pos.y);
        return true;
      }
      if (pos.x == goal_x[2]  && keyPressed && key == 'k')
      {
        judge(pos.x,pos.y);
        return true;
      }
    }*/
    if (abs(pos.y -goal_y) < box_h/2.0 + box_h && keyPressed){
      if((goal_x[0] == pos.x && key == 'd')||
         (goal_x[1] == pos.x && key == 'f')||
         (goal_x[2] == pos.x && key == 'k')){
        sum++;
        text("PERFECT", pos.x, pos.y - box_h);
        hikaru_able = 1;
        hikaru_timer = my_timer;
        cxx = pos.x;
        cyy = pos.y - 30;
        
        for(int pid = 0;pid < MAX_PARTICLE;pid++){
          hikaru_p[pid].explode(); 
        }
        killBody();
        return true;
      }
    }
    return false;
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    fill(0, 255, 0, 200);
    stroke(0, 255, 0, 128);
    rect(0,0, box_w, box_h);
    popMatrix();
  }
  
  void display_goal()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float a = map(goal_y - pos.y, 2.0*box_h, 0, 80, 255);
    bww = box_w;
    bhh = map(goal_y - pos.y, 0.0, 2.0*box_h, 0.0, 2.5*box_h);

    if (goal_y - pos.y >= 0 && goal_y - pos.y < 2.0* box_h)
    {
      rectMode(CENTER);
      pushMatrix();
      translate(pos.x , goal_y - box_h/2);
      fill(255, 255, 0, a);
      noStroke();
      rect(0,0, bww, bhh);
      popMatrix();
    }
  }
  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
 // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 4.8;
    fd.friction = 0.5;
    fd.restitution = 0.5;
 // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
  /*void judge(float pos_x,float pos_y)
  {
    fill(255);
    ts = 16;
    ts2 = 32;
    textSize(ts2);
    float gap;
    gap = abs(pos_y - goal_y);
  
    if(gap >= box_h/3.0 && gap < box_h/2.0){
      text("PERFECT", pos_x, pos_y - box_h);
      killBody();
    }
    if(gap >= box_h/2.0 && gap < box_h/1.5){
      text("GOOD", pos_x, pos_y - box_h);
      killBody();
    }
    if(gap >= box_h/1.5 && gap < box_h){
      text("MISS", pos_x, pos_y - box_h);
      killBody();
    }
    
  }*/
}

void add_box(int type)
{
  Box p = new Box(goal_x[type], start_y);
  boxes.add(p);
}
