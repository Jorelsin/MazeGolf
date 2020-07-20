class Ball{
  
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  public Ball(float x, float y) {
    pos = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topSpeed = 15;
  }
  
  public void Draw(){  
    Update();
    ellipse(pos.x,pos.y, 10, 10);
  }
  
  public void addForce(PVector force){
     
    acceleration = PVector.sub(force, pos).mult(-1);
    
  }
  public void Update(){
   
    //acceleration.setMag(0.2);
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    acceleration.mult(0.4);
    
    if(pos.y <= 0 || pos.y >= height){
      velocity.y = velocity.y * -1;
      acceleration.y = acceleration.y * -1;
    }
    
    if(pos.x <= 0|| pos.x >= width){
      velocity.x = velocity.x * -1;
      acceleration.x = acceleration.x * -1;
    }
    
    pos.add(velocity);
    velocity.mult(0.92);
    
  }
  
  
}
