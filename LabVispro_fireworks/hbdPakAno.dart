import 'dart:async';
import 'dart:io';

// ASCII art for letters H, B, D, A, N, O, P, K (all made symmetrical with same width)
final Map<String, List<String>> asciiLetters = {
  'H': [
    'HH   HH',
    'HH   HH',
    'HHHHHHH',
    'HH   HH',
    'HH   HH',
  ],
  'B': [
    'BBBBBB ',
    'BB   BB',
    'BBBBBB ',
    'BB   BB',
    'BBBBBB ',
  ],
  'D': [
    'DDDDDD ',
    'DD   DD',
    'DD   DD',
    'DD   DD',
    'DDDDDD ',
  ],
  'A': [
    '  AAA  ',
    ' AA AA ',
    'AAAAAAA',
    'AA   AA',
    'AA   AA',
  ],
  'N': [
    'NN   NN',
    'NNN  NN',
    'NN N NN',
    'NN  NNN',
    'NN   NN',
  ],
  'O': [
    ' OOOOO ',
    'OO   OO',
    'OO   OO',
    'OO   OO',
    ' OOOOO ',
  ],
  'P': [
    'PPPPPPP',
    'PP   PP',
    'PPPPPPP',
    'PP     ',
    'PP     ',
  ],
  'K': [
    'KK   KK',
    'KK  KK ',
    'KKKK   ',
    'KK  KK ',
    'KK   KK',
  ],
  ' ': [
    '       ',
    '       ',
    '       ',
    '       ',
    '       ',
  ]
};

// Function to clear the screen
void clearScreen() {
  stdout.write('\x1b[2J\x1b[H');
}

// Function to move the cursor to a specific position
void moveCursor(int x, int y) {
  stdout.write('\x1b[${y};${x}H');
}

// Function to display repeated ASCII letters centered and with animation from bottom to top
Future<void> animateAsciiArt(String text) async {
  List<String> lines = List.filled(5, ''); // Create 5 empty lines for ASCII art rows

  // Prepare ASCII art for each letter
  for (var char in text.split('')) {
    if (asciiLetters.containsKey(char)) {
      List<String> asciiLetter = asciiLetters[char]!;
      for (int i = 0; i < asciiLetter.length; i++) {
        lines[i] += asciiLetter[i] + ' '; // Add letter to each line with spacing
      }
    }
  }

  // Get terminal size
  int height = stdout.terminalLines; // Current terminal height
  int width = stdout.terminalColumns; // Current terminal width

  // Calculate target row to place the text at the middle of the screen
  int targetRow = (height ~/ 2) - (lines.length ~/ 2);

  // Display text in the center
  clearScreen();
  for (int i = 0; i < lines.length; i++) {
    // Center the text horizontally
    int centerX = (width ~/ 2) - (lines[i].length ~/ 2);
    moveCursor(centerX, targetRow + i); // Move cursor to center
    stdout.writeln(lines[i]); // Write each line of ASCII art
  }
}
