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

// Function to display repeated ASCII letters with slow upward animation and stop at the center
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

  // Calculate the target row where the text should stop (center of the screen)
  int targetRow = (height ~/ 2) - (lines.length ~/ 2);

  // Start from the bottom of the terminal
  int startRow = height - lines.length;

  // Animate text from bottom to target row
  for (int row = startRow; row >= targetRow; row--) {
    clearScreen(); // Clear the screen before each frame

    // Display the text row by row
    for (int i = 0; i < lines.length; i++) {
      int centerX = (width ~/ 2) - (lines[i].length ~/ 2); // Center horizontally
      moveCursor(centerX, row + i); // Move cursor to new position
      stdout.writeln(lines[i]); // Write each line of ASCII art
    }

    await Future.delayed(Duration(milliseconds: 100)); // Delay for animation effect
  }
}
