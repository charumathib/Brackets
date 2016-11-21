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
  drawBracketsImproved(8);
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
  case 2 :
  case 3 :
    players = selectWinner(players); //<>//
    counter++;
    printWinners(counter, players);    
    break;
  default: // Button clicked more times
    reset();
    break;
  }
}


public void printWinners(int buttonClicked, StringList winners) {
  fill(#FC0808);
  textSize(12);

  if ( buttonClicked == 1) { 
    text(winners.get(0), 97, 73);
    text(winners.get(1), 97, 247);
    text(winners.get(2), 97, 422);
    text(winners.get(3), 97, 597);
    text(winners.get(4), 725, 73);
    text(winners.get(5), 725, 247);
    text(winners.get(6), 725, 422);
    text(winners.get(7), 725, 597);
  } else if ( buttonClicked == 2) { 
    text(winners.get(0), 180, 160);
    text(winners.get(1), 180, 508);
    text(winners.get(2), 635, 160);
    text(winners.get(3), 635, 508);
  } else if (buttonClicked == 3) {
    text(winners.get(0), 272, 335);
    text(winners.get(1), 547, 335);
  } else if (buttonClicked == 4) {
    textSize(15);
    fill(#1C0AF2);
    text(winners.get(0).toUpperCase(), 395, 345);
  }
}


public void drawNames() {
  fill(#FC0808);
  textSize(12);
  // Left Players
  text(getName(), 10, 30);
  text(getName(), 10, 115);
  text(getName(), 10, 203);
  text(getName(), 10, 290);
  text(getName(), 10, 377);
  text(getName(), 10, 463);
  text(getName(), 10, 550);
  text(getName(), 10, 639);
  // Right Players
  text(getName(), 810, 30);
  text(getName(), 810, 115);
  text(getName(), 810, 203);
  text(getName(), 810, 290);
  text(getName(), 810, 377);
  text(getName(), 810, 463);
  text(getName(), 810, 550);
  text(getName(), 810, 639);
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

public void reset() {
  background(255);
  counter = 0;
  drawBracketsImproved(8);
  loadPlayers();
  drawNames();
}

public void loadPlayers() { 
  participants = new StringList(loadStrings("PlayersWithRankings.txt"));
  players = new StringList();
}