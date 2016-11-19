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
StringList finalWinner = new StringList();
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
  switch(counter) {  
  case 0 : // Button Clicked 1 time
    playersFinals = selectWinner(playersSemiFinals);
    counter++;
    printWinners(counter, playersFinals);
    break ;
  case 1 : // Button clicked 2 times   
    finalWinner = selectWinner(playersFinals);
    counter++;
    printWinners(counter, finalWinner);
    break;
  default: // Button clicked more times
    break;
  }
}

public void printWinners(int buttonClicked, StringList winners) {
  if ( buttonClicked == 1) { 
    text(winners.get(0), 220, 345);
    text(winners.get(1), 440, 345);
  } else if ( buttonClicked == 2) { 
    text(winners.get(0), 400, 250);
  }
}

//text(playersFinals.get(winnerPosition), 400, 250);
//    text(playersFinals.get(k), 220 * (k+1), 345);


public void drawBrackets() {
  tint(255, 127);
  //img = loadImage("chess.jpg");
  //image(img, 0, 0, width, height);
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

public String whoIsTheWinner(String player1, int rank1, String player2, int rank2) { 
  // Based on the lesser rank number, determine which player gets to be high priority
  String highRankingPlayer = ( rank1 < rank2) ? player1 : player2 ; 

  // If a player is high priority, then the other player is low priority
  String lowRankingPlayer = (highRankingPlayer.equals(player2)) ? player1 : player2 ;

  int winner = int(random(5));

  if (winner % 4 == 1) {
    return lowRankingPlayer;    // Low priority
  } else {
    return highRankingPlayer;    // High Priority
  }
}

public StringList selectWinner(StringList players) {
  fill(#FC0808);
  String player1, player2, winnerPlayer;
  int player1Rank, player2Rank;
  StringList winners = new StringList();

  for ( int i = 0; i < players.size(); i += 2) { 
    player1 = players.get(i);
    player2 = players.get(i+1);
    player1Rank = 1 ; // Some value for now
    player2Rank = 2 ; // Some value for now
    winnerPlayer = whoIsTheWinner(player1, player1Rank, player2, player2Rank);
    winners.append(winnerPlayer);
  }
  return winners;
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
    finalWinner = new StringList();
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