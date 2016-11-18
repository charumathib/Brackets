import g4p_controls.*;
GButton selectWinner;
boolean round1 = false;
boolean round2 = false;
boolean clickedOnce = false;
float i;
float winner;
float a;
float winner2;
String[] participants = {"Charumathi", "Ariane", "Tyler", "Jaume", "Theresa", "Henry", "Alex"};
PImage img;


public void setup() {
  size(900, 700);
  background(255);
  selectWinner = new GButton(this, 350, 150, 200, 50, "Select Winner");
  drawNames();
  drawBrackets();
}

public void draw() {
  i = random(5);
  winner = random(5);
  a = random(5);
  winner2 = random(5);
}

public void handleButtonEvents(GButton selectWinner, GEvent event) {
  if (!clickedOnce) {
    selectWinner();
  } else {
    lastRound();
  }
}



public void drawBrackets() {
  tint(255, 127);
  img = loadImage("chess.jpg");
  image(img, 0, 0, width, height);
  fill(0);
  rect(50, 50, 150, 5);
  rect(200, 50, 5, 600);
  rect(50, 645, 150, 5);
  rect(700, 50, 150, 5);
  rect(700, 50, 5, 600);
  rect(700, 645, 150, 5);
  rect(200, 350, 150, 5);
  rect(550, 350, 150, 5);
  rect(350, 250, 200, 5);
}

public void drawNames() {
  fill(#FC0808);
  textSize(20);
  text("Charumathi", 70, 45);
  text("Jaume", 770, 45);
  text("Tyler", 70, 640);
  text("Henry", 770, 640);
}

public void selectWinner() {
  fill(#FC0808);
  int winner = int(random(5));
  int winner2 = int(random(5));

  if (winner % 4 == 1) {
    text("Tyler", 230, 350);
    round1 = true;
  } else {
    text("Charumathi", 210, 350);
  }
  if (winner2 % 4 == 1) {
    text("Henry", 570, 350);
    round2 = true;
  } else {
    text("Jaume", 570, 350);
  }
  clickedOnce = true;
}

public void lastRound() {
  fill(#FC0808);
  int finalWinner = int(random(5));
  if (finalWinner % 4 == 1) {
    if (round1 && round2) {
      text("Henry", 390, 250);
    } 
    if (round1 && !round2) {
      text("Tyler", 390, 250);
    }
    if (round2 && !round1) {
      text("Henry", 390, 250);
    }
    if (!round1 && !round2) {
      text("Jaume", 390, 250);
    }
  }
  if (finalWinner % 4 !=1) {
    if (round1 && round2) {
      text("Tyler", 390, 250);
    } 
    if (round1 && !round2) {
      text("Jaume", 390, 250);
    }
    if (round2 && !round1) {
      text("Charumathi", 380, 250);
    }
    if (!round1 && !round2) {
      text("Charumathi", 380, 250);
    }
  }
}

public void resetBooleans() {
  round1 = false;
  round2 = false;
  clickedOnce = false;
}

public void keyPressed() {
  if (key == ENTER) {
    background(255);
    resetBooleans();
    drawBrackets();
    drawNames();
  }
}