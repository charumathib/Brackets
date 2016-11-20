import g4p_controls.*;
GButton selectWinner;
StringList participants ;
PImage img;
StringList players;
int counter;



public void setup() {
  size(900, 700);
  background(255);
  selectWinner = new GButton(this, 350, 150, 200, 50, "Select Winner");
  loadPlayers();
  drawBrackets();
  drawNames();
  counter = 0;
  noStroke();
}

public void draw() {
}

public void handleButtonEvents(GButton selectWinner, GEvent event) {
  switch(counter) {  
  case 0 : // Button Clicked 1st time. Do the same thing as Case = 1
  case 1 : // Button clicked 2 times   
    players = selectWinner(players);
    counter++;
    printWinners(counter, players);    
    break;
  default: // Button clicked more times
    break;
  }
}


public void printWinners(int buttonClicked, StringList winners) {
  fill(#FC0808);

  if ( buttonClicked == 1) { 
    text(winners.get(0), 220, 345);
    text(winners.get(1), 550, 345);
  } else if ( buttonClicked == 2) { 
    text(winners.get(0), 400, 230);
  }
}


public void drawBrackets() {
  tint(219, 40);
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
  textSize(26);
  // Left Players
  text(getName(), 65, 45);
  text(getName(), 65, 640);
  // Right Players
  text(getName(), 710, 45);
  text(getName(), 710, 640);
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