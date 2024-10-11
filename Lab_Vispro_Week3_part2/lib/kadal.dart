import 'dart:io';
import 'dart:math';

const String lizardHead = ' O'; // Lizard head shape
const String lizardHandsLeft = 'OOO'; // Lizard left hands shape
const String lizardHandsRight = 'OOO'; // Lizard right hands shape
const String lizardBody = ' O'; // Lizard body shape
const String food = 'x'; // Food shape

// Mendapatkan ukuran terminal secara dinamis
List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

class Point {
  int x, y;
  Point(this.x, this.y);
}

class Lizard {
  Point head; // Head position of the lizard
  List<Point> body = []; // List to hold the body segments
  String direction; // Direction of movement ('left' or 'right')

  Lizard(this.head) : direction = 'right' {
    // Inisialisasi dengan satu segmen tubuh saat pertama kali
    body.add(Point(head.x, head.y)); // Tambahkan satu segmen tubuh
  }

  void move(Point movement) {
    // Store previous head position for body movement
    int previousX = head.x;
    int previousY = head.y;

    // Move the head in the given direction
    head.x += movement.x; // Move head in the given direction
    head.y += movement.y;

    // Shift body segments
    if (body.isNotEmpty) {
      for (int i = body.length - 1; i > 0; i--) {
        body[i] = body[i - 1];
      }
      body[0] = Point(previousX, previousY); // Move head position to body
    }

    // Update direction based on movement
    if (movement.x < 0) {
      direction = 'left';
    } else if (movement.x > 0) {
      direction = 'right';
    }
  }

  void grow() {
    body.add(Point(body.last.x, body.last.y)); // Add a new segment when growing
  }

  bool isAt(Point point) {
    return head.x == point.x && head.y == point.y; // Check if head is at the food position
  }
}

void main() {
  stdout.write('\x1B[?25l'); // Hide the cursor

  var screenSize = getScreenSize();
  int gridWidth = screenSize[0];
  int gridHeight = screenSize[1];

  // Initialize the lizard at a specific position in the center
  Lizard lizard = Lizard(Point(gridWidth ~/ 2, gridHeight ~/ 2));
  Point foodPosition = getRandomPosition(gridWidth, gridHeight);

  // Draw the initial lizard shape
  drawInitialLizard(lizard);

  while (true) {
    // Cek ukuran terminal setiap iterasi untuk responsif
    screenSize = getScreenSize();
    gridWidth = screenSize[0];
    gridHeight = screenSize[1];

    clearScreen();

    if (lizard.isAt(foodPosition)) {
      lizard.grow(); // Grow the lizard when it eats
      foodPosition = getRandomPosition(gridWidth, gridHeight); // Get new food position
    }

    Point direction = getDirection(lizard.head, foodPosition);
    lizard.move(direction); // Move the lizard toward the food

    drawLizard(lizard); // Draw the lizard
    drawObject(foodPosition, food); // Draw the food

    sleep(Duration(milliseconds: 200));
  }
}

Point getRandomPosition(int width, int height) {
  Random random = Random();
  // Hindari posisi di luar area terminal yang valid
  return Point(random.nextInt(width - 1), random.nextInt(height - 1));
}

Point getDirection(Point from, Point to) {
  int dx = to.x - from.x;
  int dy = to.y - from.y;

  // Prioritaskan gerakan horizontal atau vertikal, bukan diagonal
  if (dx.abs() > dy.abs()) {
    return Point(dx ~/ dx.abs(), 0); // Gerak horizontal dulu
  } else if (dy != 0) {
    return Point(0, dy ~/ dy.abs()); // Gerak vertikal jika horizontal selesai
  }
  return Point(0, 0); // Jika sudah di posisi yang sama
}

void drawInitialLizard(Lizard lizard) {
  // Draw the lizard in the specified initial shape
  int headX = lizard.head.x;
  int headY = lizard.head.y;

  // Draw head
  drawObject(Point(headX, headY), lizardHead);
  
  // Draw hands based on initial direction
  drawObject(Point(headX - 2, headY + 1), lizardHandsRight); // Left hand
  drawObject(Point(headX + 2, headY + 1), lizardHandsLeft); // Right hand

  // Draw body (adjusted to appear in the correct position)
  drawObject(Point(headX, headY + 2), lizardBody); // Body

  // Draw feet (adjusted to appear in the correct position)
  drawObject(Point(headX, headY + 3), lizardBody); // Middle foot
  drawObject(Point(headX - 2, headY + 4), lizardBody); // Left foot
  drawObject(Point(headX + 2, headY + 4), lizardBody); // Right foot
}

void drawLizard(Lizard lizard) {
  // Draw the lizard in the specified shape
  int headX = lizard.head.x;
  int headY = lizard.head.y;

  // Draw head
  drawObject(Point(headX, headY), lizardHead);
  
  // Draw hands based on direction
  if (lizard.direction == 'left') {
    drawObject(Point(headX - 2, headY + 1), lizardHandsLeft); // Left hand
    drawObject(Point(headX + 2, headY + 1), lizardHandsRight); // Right hand
  } else {
    drawObject(Point(headX - 2, headY + 1), lizardHandsRight); // Left hand
    drawObject(Point(headX + 2, headY + 1), lizardHandsLeft); // Right hand
  }

  // Draw body
  drawObject(Point(headX, headY + 2), lizardBody); // Body

  // Draw additional body segments based on length
  for (int i = 0; i < lizard.body.length; i++) {
    drawObject(Point(headX, headY + 3 + i), lizardBody);
  }

  // Draw feet
  drawObject(Point(headX - 2, headY + 2 + lizard.body.length), lizardBody); // Left foot
  drawObject(Point(headX + 2, headY + 2 + lizard.body.length), lizardBody); // Right foot
}

void drawObject(Point position, String symbol) {
  stdout.write('\x1B[${position.y + 1};${position.x + 1}H$symbol'); // Move cursor and draw the symbol
}

void clearScreen() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H'); // Clear screen for Windows
  } else {
    stdout.write('\x1B[2J\x1B[H'); // Clear screen for other OS
  }
}
