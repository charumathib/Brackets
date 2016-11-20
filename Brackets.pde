import g4p_controls.*;
GButton selectWinner;
StringList participants ;
PImage img;
StringList players;
int counter = 0;



public void setup() {
  fullScreen();
  background(255);
  // selectWinner = new GButton(this, 350, 150, 200, 50, "Select Winner");
  loadPlayers();
  drawNames();
  drawBrackets();
  noStroke();
}

public void draw() {
}

public void handleButtonEvents(GButton selectWinner, GEvent event) {
  switch(counter) {  
  case 0 : // Button Clicked 1 time
    determineWinners();
    break ;
  case 1 : // Button clicked 2 times   
    determineWinners();
    break;
  default: // Button clicked more times
    break;
  }
}

public void determineWinners() { 
  players = selectWinner(players);
  counter++;
  printWinners(counter, players);
}

public void printWinners(int buttonClicked, StringList winners) {
  fill(#FC0808);

  if ( buttonClicked == 1) { 
    text(winners.get(0), 220, 345);
    text(winners.get(1), 440, 345);
  } else if ( buttonClicked == 2) { 
    text(winners.get(0), 400, 250);
  }
}


public void drawBrackets() {
  tint(255, 127);
  //img = loadImage("chess.jpg");
  //image(img, 0, 0, width, height);
  drawBrackets(4);
}

public void drawNames() {
  fill(#FF1C03);
  textSize(20);
  // Left Players
  text(getName(), 65, 45);
  text(getName(), 65, 640);
  // Right Players
  text(getName(), 775, 45);
  text(getName(), 775, 640);
}

// This method gets randomly unique players from the string list of players.
public String getName() { 
  String name = participants.get(int(random(participants.size())));
  players.append(name); // Add the randomly selected players to the initialPlayers map
  for ( int i = 0; i < participants.size(); i++) { 
    if ( participants.get(i).equals(name)) { 
      participants.remove(i);
    }
  }
  return name;
}

public String whoIsTheWinner(String player1, int rank1, String player2, int rank2) { 
  // Based on the lesser rank number, determine which player gets to be high priority
  String highRankingPlayer, lowRankingPlayer;
  if (rank1<rank2) {
    highRankingPlayer = player1;
    lowRankingPlayer = player2;
  } else {
    highRankingPlayer = player2;
    lowRankingPlayer = player1;
  } 

  if (int(random(5)) % 4 == 1) {
    return lowRankingPlayer;    // Low priority
  } else {
    return highRankingPlayer;    // High Priority
  }
}

public StringList selectWinner(StringList players) {
  StringList winners = new StringList();

  for ( int i = 0; i < players.size(); i += 2) { 
    String player1 = players.get(i);
    String player2 = players.get(i+1);
    int player1Rank = int(splitTokens(player1, ". ")[0]) ; 
    int player2Rank = int(splitTokens(player2, ". ")[0]) ; 
    String winnerPlayer = whoIsTheWinner(player1, player1Rank, player2, player2Rank);
    winners.append(winnerPlayer);
  }
  return winners;
}

public void keyPressed() {
  if (key == ENTER) {
    background(255);
    counter = 0;
    drawBrackets();
    loadPlayers();
    drawNames();
  }
}

public void loadPlayers() { 
  participants = new StringList(loadStrings("PlayersWithRankings.txt"));
  players = new StringList();
}