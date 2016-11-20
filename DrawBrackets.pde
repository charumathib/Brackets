public void drawBrackets(int players) {

  println( height , width);
  fill(0);
  int start = 50;
  int offset = 0;
  int x, w ;
  x = offset;
  w = width/players-offset;
  int h = 5 ;
  float times = 0 ;
  for (float i = start + (height/players) * times; i<= height-players; i+= height/players) {
    float y = i;
    rect(x, y, w, h);
    int x1 = width-width/players-2 * offset;
    int w1 = width/players-offset;
    rect(x1, y, w1, h);
  }

  x = x + w;
  times = times + 0.5 ;
  for (float i = start + (height/players) * times; i<= height- (players/2); i+= 2* height/players) {
    float y = i;
    rect(x, y, w, h);
    int x1 = width-2*width/players-offset;
    int w1 = width/players-2*offset;
    rect(x1, y, w1, h);
  }  

  x = x + w;
  times = times + 1 ;
  for (float i =  start + (height/players)*times; i<= (height- (players/2)); i+= 4* height/players) {
    float y = i;
    rect(x, y, w, h);
    int x1 = width-3*width/players-offset;
    int w1 = width/players-2*offset;
    rect(x1, y, w1, h);
  }  


  x = x + w;
  times = times + 2 ;
  for (float i =  start + (height/players)*times; i<= (height- (players/2)); i+= 8* height/players) {
    float y = i;
    rect(x, y, w, h);
    int x1 = width-4*width/players-offset;
    int w1 = width/players-2*offset;
    rect(x1, y, w1, h);
  }  

  for (float i = start; i<=start + (players + 1)*height/players; i+=2*height/players) {
    rect(width/players, i, 5, height/players+5);
    rect(width-width/players-2*offset-10+10, i, 5, height/players+5);
  }
  for (float i = start + height/players/2; i<=start + (players + 1)*height/players; i+=4*height/players) {
    rect(2 * width/players-offset, i, 5, 2* height/players+5);
    rect(width-2*width/players-2*offset+10, i, 5, 2* height/players+5);
  }
  for (float i = start + 1.5*height/players; i<=start + (players + 1)*height/players; i+=6*height/players) {
    rect(3 * width/players-offset-10, i, 5, 4* height/players+5);
    rect(width-3*width/players-2*offset+10, i, 5, 4* height/players+5);
  }
}  