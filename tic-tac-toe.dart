// Tic Tac Toe game
import 'dart:io';

bool winner = false;
bool isXTurn = true;
int moveCount = 0;

List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

// wining combinations
List<List<int>> winCombinations = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
  [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
  [0, 4, 8], [2, 4, 6] // diagonals
];

// create board
void createBoard() {
  print(' ${values[0]} | ${values[1]} | ${values[2]} ');
  print('---+---+---');
  print(' ${values[3]} | ${values[4]} | ${values[5]} ');
  print('---+---+---');
  print(' ${values[6]} | ${values[7]} | ${values[8]} ');
}

// get user input
void getNextCharacter() {
  print('Choose number for ${isXTurn ? 'X' : 'O'}');
  int number = int.parse(stdin.readLineSync()!);

  values[number - 1] = isXTurn ? 'X' : 'O';
  isXTurn = !isXTurn;
  moveCount++;

  if (moveCount == 9) {
    winner = true;
    print('Draw');
  } else {
    clearScreen();
  }
}

// check winner for player
bool checkWinner(String checkFor) {
  for (List<int> combination in winCombinations) {
    if (combination.every((index) => values[index] == checkFor)) {
      return true;
    }
  }
  return false;
}

// clear screen
void clearScreen() {
  print('\x1B[2J\x1B[0;0H');
  createBoard();
  if (checkWinner('X')) {
    winner = true;
    print('Player X wins!');
  } else if (checkWinner('O')) {
    winner = true;
    print('Player O wins!');
  } else {
    getNextCharacter();
  }
}

void main() {
  print('Welcome to Tic Tac Toe Game');
  createBoard();
  clearScreen();
}
