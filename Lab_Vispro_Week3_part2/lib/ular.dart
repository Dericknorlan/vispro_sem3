import 'dart:io';
import 'dart:math';

const String lizardHead = '@';
const String lizardBody = 'o';
const String food = 'x';

// Mendapatkan ukuran terminal secara dinamis
List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

class Point {
  int x, y;
  Point(this.x, this.y);
}

class Lizard {
  Point head;
  List<Point> body = [];
  Lizard(this.head);

  void move(Point direction) {
    if (body.isNotEmpty) {
      for (int i = body.length - 1; i > 0; i--) {
        body[i] = body[i - 1];
      }
      body[0] = Point(head.x, head.y);
    }
    head.x += direction.x;
    head.y += direction.y;
  }

  void grow() {
    body.add(Point(head.x, head.y));
  }

  bool isAt(Point point) {
    return head.x == point.x && head.y == point.y;
  }
}

void main() {
  // Hide the cursor
  stdout.write('\x1B[?25l');

  var screenSize = getScreenSize();
  int gridWidth = screenSize[0];
  int gridHeight = screenSize[1];

  Lizard lizard = Lizard(Point(gridWidth ~/ 2, gridHeight ~/ 2));
  Point foodPosition = getRandomPosition(gridWidth, gridHeight);

  while (true) {
    // Cek ukuran terminal setiap iterasi untuk responsif
    screenSize = getScreenSize();
    gridWidth = screenSize[0];
    gridHeight = screenSize[1];

    clearScreen();

    if (lizard.isAt(foodPosition)) {
      lizard.grow();
      foodPosition = getRandomPosition(gridWidth, gridHeight);
    }

    drawObject(lizard.head, lizardHead);
    for (var segment in lizard.body) {
      drawObject(segment, lizardBody);
    }
    drawObject(foodPosition, food);

    Point direction = getDirection(lizard.head, foodPosition);
    lizard.move(direction);

    sleep(Duration(milliseconds: 100));
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
  if (dx != 0) {
    return Point(dx ~/ dx.abs(), 0); // Gerak horizontal dulu
  } else if (dy != 0) {
    return Point(0, dy ~/ dy.abs());  // Gerak vertikal jika horizontal selesai
  }
  return Point(0, 0); // Jika sudah di posisi yang sama
}

void drawObject(Point position, String symbol) {
  stdout.write('\x1B[${position.y + 1};${position.x + 1}H$symbol');
}

void clearScreen() {
  if (Platform.isWindows) {
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    stdout.write('\x1B[2J\x1B[H');
  }
}
