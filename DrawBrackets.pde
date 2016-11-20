public void drawBrackets(int players) {
  fill(0);
  // height = 900 ; removing 100 gets us 800 which is perfectly divisible by 16,8,4, etc
  float yOffset = 50;
  float xOffset = 10;
  float x, w ;
  x = xOffset;
  w = width/players-xOffset;
  int h = 5 ;
  float times = 0 ;

  for ( float k = 0; k < log2(players)+1; k++) { 
    x = xOffset + k*w; //<>//
    times += k * 0.5 ;
    int lineCounter = 0;
    for (float i = yOffset + (height/players) * times; i<= height- players/pow(2,k); i+= pow(2,k)*(height/players)) {
      lineCounter++;
      float y = i;
      rect(x, y, w, h);
      //int x1 = width-width/players-2 * offset;
      //int w1 = width/players-offset;
      //rect(x1, y, w1, h);
    }
    println(lineCounter);
  }

  //for (float i = start; i<=start + (players + 1)*height/players; i+=2*height/players) {
  //  rect(width/players, i, 5, height/players+5);
  //  rect(width-width/players-2*offset-10+10, i, 5, height/players+5);
  //}
  //for (float i = start + height/players/2; i<=start + (players + 1)*height/players; i+=4*height/players) {
  //  rect(2 * width/players-offset, i, 5, 2* height/players+5);
  //  rect(width-2*width/players-2*offset+10, i, 5, 2* height/players+5);
  //}
  //for (float i = start + 1.5*height/players; i<=start + (players + 1)*height/players; i+=6*height/players) {
  //  rect(3 * width/players-offset-10, i, 5, 4* height/players+5);
  //  rect(width-3*width/players-2*offset+10, i, 5, 4* height/players+5);
  //}
}  

public float log2(int x) { 
  return ( log(x) / log(2));
}