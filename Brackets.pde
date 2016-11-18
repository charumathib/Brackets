import g4p_controls.*;
GButton selectWinner;
boolean round1 = false;
boolean round2 = false;
boolean clickedOnce = false;
float i;
float winner;
float a;
float winner2;
StringList participants = getPlayers();
PImage img;
StringList playersSemiFinals = new StringList();
StringList playersFinals = new StringList();
int counter = 0;



public void setup() {
  size(900, 700);
  background(255);
  selectWinner = new GButton(this, 350, 150, 200, 50, "Select Winner");
  drawNames();
  drawBrackets();
}

public void draw() {
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
  fill(#FF1C03);
  textSize(20);
  textAlign(LEFT);
  // Left Players
  text(getName(), 65, 45);
  text(getName(), 65, 640);
  textAlign(RIGHT);
  // Right Players
  text(getName(), 775, 45);
  text(getName(), 775, 640);
}

// This method gets randomly unique players from the string list of players.
public String getName() { 
  String name = participants.get(int(random(participants.size())));
  playersSemiFinals.append(name); // Add the randomly selected players to the playersSemiFinals map
  for ( int i = 0; i < participants.size(); i++) { 
    if ( participants.get(i).equals(name)) { 
      participants.remove(i);
    }
  }
  return name;
}

public void selectWinner() {
  fill(#FC0808);
  int winner = int(random(5));
  int winner2 = int(random(5));

  int winnerPosition; // Use this to track who will win

  // Determine left side winner
  if (winner % 4 == 1) {
    winnerPosition = 0; // Left side first player is the winner
  } else {
    winnerPosition = 1; // Left side second player is the winner
  }
  text(playersSemiFinals.get(winnerPosition), 220, 345);
  playersFinals.append(playersSemiFinals.get(winnerPosition)); // add the left side winner to the final player map

  // Determine right side winner
  if (winner2 % 4 == 1) {
    winnerPosition = 3 ; // Right side second player is the winner
  } else {
    winnerPosition = 2 ; // Right side first player is the winner
  }
  text(playersSemiFinals.get(winnerPosition), 520, 345);
  playersFinals.append(playersSemiFinals.get(winnerPosition)); // add the right side winner to the final player map

  clickedOnce = true;
}

public void lastRound() {
  fill(#FC0808);
  int finalWinner = int(random(5));
  int winnerPosition; // Use this to track who will win
  if (finalWinner % 4 == 1) {
    winnerPosition = 0; // Left side player wins
  } else { 
    winnerPosition = 1; // Right side player wins
  } 
  text(playersFinals.get(winnerPosition), 400, 250);
}

public void resetBooleans() {
  round1 = false;
  round2 = false;
  clickedOnce = false;
}

public void keyPressed() {
  if (key == ENTER) {
    background(255);
    playersSemiFinals = new StringList();
    playersFinals = new StringList();
    counter = 0;
    resetBooleans();
    drawBrackets();
    participants = getPlayers();
    drawNames();
  }
}

public StringList getPlayers() { 
  return new StringList("Charumathi", "Ariane", "Tyler", "Jaume", "Theresa", "Henry", "Alex");
}