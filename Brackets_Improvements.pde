public void drawBracketsImproved(int players) {
  tint(219, 40);
  img = loadImage("chess.jpg");
  image(img, 0, 0, width, height);
  fill(0);
  for (float i = 10 + (height/players/4); i<= height-players; i+= height/players) {
    rect(7, i, height/players, 5);
    rect(width-(height/players)-10, i, height/players, 5);
  }
  for (float i = 10 + (height/players/4)+height/players/2; i<= height-players; i+= 2*height/players) {
    rect(width/players-20, i, height/players, 5);
    rect(width - 2*(width/players)+40, i, height/players, 5);
  }
  for (float i = 10 + (height/players/4)+height/players/2+height/players; i<= height-players; i+= 4*height/players) {
    rect(2*width/players-45, i, height/players, 5);
    rect(width - 3*(width/players)+65, i, height/players, 5);
  }
  for (float i = 3.5*height/players + 10 + (height/players/4); i<= height-players; i+= 8*height/players) {
    rect(3*width/players-70, i, height/players, 5);
    rect(width - 4*(width/players)+90, i, height/players, 5);
  }
  for (float i = 10+height/players/4; i<=height-players; i+=2*height/players) {
    rect(width/players-(width/players/4)+5, i, 5, height/players);
    rect(width-(height/players)-(width/players/4)+18, i, 5, height/players);
  }
  for (float i = 10+height/players/4 + height/players/2; i<=height-players; i+=4*height/players) {
    rect(2*width/players-(width/players/4)-23, i, 5, 2*height/players);
    rect(width-2*(height/players)-(width/players/4)+18, i, 5, 2*height/players);
  }
  for (float i = 1.5*height/players + 10 + (height/players/4); i<=height-players; i+=8*height/players) {
    rect(3*width/players-(width/players/4)-47, i, 5, 4*height/players);
    rect(width-3*(height/players)-(width/players/4)+18, i, 5, 4*height/players);
  }
  rect(width/2-width/players/2, height/2-2.5, width/players-10, 5);
} 