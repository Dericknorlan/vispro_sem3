import 'ascii.dart' as color;
import 'firework.dart' as fireworks;
import 'hbdPakAno.dart' as hbd;
import 'dart:async';
import 'dart:math';
import 'dart:io';

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void printCode(String text, int width, int height) {
  int screenHeight = getScreenSize()[1];

  // Hitung posisi horizontal (di tengah layar)
  int centerX = width;

  // Hitung posisi vertikal (di tengah layar)
  int centerY = screenHeight - height;

  // Pindahin kursor ke tengah layar
  stdout.write('\x1B[${centerY};${centerX}H');

  // Print teks
  stdout.write(text);

  // Reset posisi kursor ke bawah
  stdout.write('\x1B[${screenHeight};0H');
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int randomMax(int max) {
  return Random().nextInt(max);
}

void main() async {
  clearScreen();
  String text = "|";
  stdout.write("Enter the number of fireworks you want to display: ");
  int? numOfFireworks = (int.parse(stdin.readLineSync()!));
  numOfFireworks = numOfFireworks < 1 ? 1 : numOfFireworks;

  clearScreen();
  for (int j = 0; j < numOfFireworks; j++) {
    int minHeight = getScreenSize()[1] ~/ 3;
    int maxWidth = 10; // Adjust this based on your firework width
    int terminalWidth = getScreenSize()[0];

    // Calculate a random X position within the terminal width
    int randomX = random(maxWidth ~/ 2, terminalWidth - (maxWidth ~/ 2));

    // Ensure that the firework is positioned so that it's centered
    randomX = max(randomX, maxWidth ~/ 2); // Ensure it's not too far left
    randomX = min(randomX,
        terminalWidth - (maxWidth ~/ 2) - 1); // Ensure it's not too far right

    int randomY = random(minHeight, getScreenSize()[1] - minHeight);
    String randomColor = color.getRandomColor();

    if (j == 0) {
      randomX = terminalWidth ~/ 2; // Center the first firework
      randomY = getScreenSize()[1] ~/ 2;
    }

    for (int i = 0; i < randomY; i++) {
      printCode(randomColor + text + color.RESET, randomX, i);
      await delay(100);
      clearScreen();
    }
    await fireworks.firework(
        randomX, getScreenSize()[1] - randomY, randomColor);
  }
  clearScreen();

  await hbd.animateAsciiArt("HBD PAK ANO");
  fireworks.moveTo(getScreenSize()[0], getScreenSize()[1]);
}
