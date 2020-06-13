int branchNum = 1;
int branchThick = 16;
final int branchIncrease = 8;

final int ARRAY_MAX = 100000;
final int DEGREE = 4;

float x[] = new float[ARRAY_MAX];
float y[] = new float[ARRAY_MAX];

// branch move pos
float mx[] = new float[ARRAY_MAX];
float my[] = new float[ARRAY_MAX];


int count = 1;

void setup() {
  size(600,400);
  background(255);
  //initialize pointing pos
  x[0] = 300;
  y[0] = 400;
  mx[0] = 0;
  my[0] = 1;
}



void draw() {  
  //countinue counting and drawing
  if(count < 399){
    strokeWeight(branchThick); 
    stroke(90,90,90);
    for(int branchi = 0; branchi < branchNum ;branchi++){
      x[branchi] -= mx[branchi];
      y[branchi] -= my[branchi];
      point(x[branchi],y[branchi]);
    }
    count++;
  }
  
  //double up tree branch
  if(count % 100 == 0){
    
    
    float tmpx[] = new float[ARRAY_MAX];
    float tmpy[] = new float[ARRAY_MAX];
    System.arraycopy(x,0,tmpx,0,x.length);
    System.arraycopy(y,0,tmpy,0,y.length);
    
    //
    for(int branchi = 0; branchi < branchNum; branchi++){
      //setting next branch from prev one branch
      for(int onebranchi = 0; onebranchi < branchIncrease; onebranchi++){
      // decide branch extend directions
      float radian = radians(random(0,180));
      mx[branchi * branchIncrease + onebranchi] = cos(radian);
      my[branchi * branchIncrease + onebranchi] = sin(radian);
      
      x[branchi * branchIncrease + onebranchi] = tmpx[branchi];
      y[branchi * branchIncrease + onebranchi] = tmpy[branchi];
      }
      //float radian = radians(random(0,180));
      //mx[branchi * branchIncrease ] = cos(radian);
      //my[branchi * branchIncrease] = sin(radian);
      
      //x[branchi * branchIncrease] = tmpx[branchi];
      //y[branchi * branchIncrease] = tmpy[branchi];
    }
    branchNum *= branchIncrease;
    branchThick /= 2;
  }
}
