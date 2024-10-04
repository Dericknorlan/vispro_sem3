import 'dart:io';
import 'ascii.dart' as color;
import 'main.dart' as main;

// Function untuk memindahkan kursor ke koordinat tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

// Function untuk mencetak frame 1 (kembang api sebelum ledak)
void printFrame1(int centerX, int centerY, String colorSelect) {
  String blackBackground = color.BG_BLACK; // Black background for the firework

  moveTo(centerY - 2, centerX - 3);
  stdout
      .write('${blackBackground}${colorSelect}     .\\|/.     ${color.RESET}');
  moveTo(centerY - 1, centerX - 3);
  stdout
      .write('${blackBackground}${colorSelect}    (\\   /)    ${color.RESET}');
  moveTo(centerY, centerX - 3);
  stdout.write('${blackBackground}${colorSelect}    - -O- -    ${color.RESET}');
  moveTo(centerY + 1, centerX - 3);
  stdout.write(
      '${blackBackground}${colorSelect}    (/${colorSelect}   \\)    ${color.RESET}');
  moveTo(centerY + 2, centerX - 3);
  stdout
      .write('${blackBackground}${colorSelect}    .\"/|\\".    ${color.RESET}');
}

void printFrame2(int centerX, int centerY, String colorSelect) {
  String blackBackground = color.BG_BLACK; // Black background for the firework

  // Mencetak bintang di sekitar frame dengan black background
  moveTo(centerY - 3, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect}   *************   ${color.RESET}');

  moveTo(centerY - 2, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect}  ***  .\\|/.  ***  ${color.RESET}');

  moveTo(centerY - 1, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect} **** (\\   /) **** ${color.RESET}');

  moveTo(centerY, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect}***** - -O- - *****${color.RESET}');

  moveTo(centerY + 1, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect} **** (/${colorSelect}   \\) **** ${color.RESET}');

  moveTo(centerY + 2, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect}  *** .\"/|\\". ***  ${color.RESET}');

  moveTo(centerY + 3, centerX - 6);
  stdout.write(
      '${blackBackground}${colorSelect}   *************   ${color.RESET}');
}

// Function untuk meng-clear layar
void clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

void changeBackground(String colorSelect) {
  print(color.getBackgroundColor(colorSelect));
  clearScreen();
}

Future<void> firework(centerX, centerY, String colorSelect) async {
  clearScreen();

  // Frame 1: Kembang api naik (titik pusat sebelum ledak)
  printFrame1(centerX, centerY, colorSelect);
  await main.delay(500); // Delay 500 milidetik

  // Frame 2: Kembang api mulai meledak
  changeBackground(colorSelect);
  clearScreen();
  printFrame2(centerX, centerY, colorSelect);
  await main.delay(500);
}
