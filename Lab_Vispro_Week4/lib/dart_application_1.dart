// Class Node untuk linked list
class Node {
  String name;
  Node? next;
  // Menyimpan tetangga dari kota beserta jaraknya
  Map<String, double> neighbors;

  // Konstruktor untuk membuat node baru dengan nama kota dan daftar tetangga.
  Node(this.name, this.neighbors);
}

// Linked list untuk kota
class CityList {
  Node? head;

  // Menambahkan kota ke linked list
  void addCity(String name, Map<String, double> neighbors) {
    Node newCity = Node(name, neighbors);
    // Jika linked list kosong, kota pertama ditambahkan sebagai head.
    if (head == null) {
      head = newCity;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newCity;
    }
  }

  // Menampilkan semua kota di dalam linked list
  void printCities() {
    Node? current = head;
    print("Daftar Kota dan Jarak Tetangga");
    print("-------------------------------------------------------");
    while (current != null) {
      print("Kota: ${current.name}, Tetangga: ${current.neighbors}");
      current = current.next;
    }
    print("-------------------------------------------------------");
  }

  // Mencari node berdasarkan nama kota
  Node? findCity(String name) {
    Node? current = head;
    while (current != null && current.name != name) {
      current = current.next;
    }
    return current;
  }
}

// Traveling Salesman Problem (TSP) menggunakan linked list
class TSP {
  CityList cityList;

  TSP(this.cityList);

  // Menghitung total jarak berdasarkan urutan kota
  double calculateTotalDistance(List<String> path) {
    double totalDistance = 0;

    for (int i = 0; i < path.length - 1; i++) {
      Node? currentCity = cityList.findCity(path[i]);
      if (currentCity != null &&
          currentCity.neighbors.containsKey(path[i + 1])) {
        totalDistance += currentCity.neighbors[path[i + 1]]!;
      } else {
        print("Jalur tidak ditemukan antara ${path[i]} dan ${path[i + 1]}");
        return double
            .infinity; // Jika jalur tidak ditemukan, kembalikan nilai tak terhingga
      }
    }

    // Menambah jarak dari kota terakhir ke kota pertama
    Node? lastCity = cityList.findCity(path.last);
    if (lastCity != null && lastCity.neighbors.containsKey(path.first)) {
      totalDistance += lastCity.neighbors[path.first]!;
    } else {
      print("Jalur tidak ditemukan antara ${path.last} dan ${path.first}");
      return double.infinity;
    }
    return totalDistance;
  }

  // Mencari rute dengan brute force sederhana
  void findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    // Menghasilkan semua permutasi dari daftar kota
    List<List<String>> allPermutations = _permutations(getAllCities());

    // Cek setiap permutasi dan hitung total jaraknya
    for (var path in allPermutations) {
      double distance = calculateTotalDistance(path);
      if (distance < shortestDistance) {
        shortestDistance = distance;
        shortestPath = path;
      }
    }

    // Menampilkan jalur terpendek dalam format yang diminta
    print("Jalur Terpendek yang Ditemukan:");
    print("Path: ${shortestPath.join(' -> ')} -> ${shortestPath.first}");
    print("Total Jarak: ${shortestDistance.toStringAsFixed(2)} km");
    print("----------------------------------\n");
  }

  // Mendapatkan semua nama kota di linked list
  List<String> getAllCities() {
    List<String> cities = [];
    Node? current = cityList.head;
    while (current != null) {
      cities.add(current.name);
      current = current.next;
    }
    return cities;
  }

  // Helper untuk menghasilkan semua permutasi
  List<List<String>> _permutations(List<String> list) {
    if (list.isEmpty) return [[]];
    List<List<String>> result = [];
    for (int i = 0; i < list.length; i++) {
      var head = list[i];
      var tail = List.of(list)..removeAt(i);
      for (var perm in _permutations(tail)) {
        result.add([head] + perm);
      }
    }
    return result;
  }
}

void main() {
  // Membuat linked list untuk kota
  CityList cities = CityList();

  // Menambahkan kota beserta tetangganya
  cities.addCity('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10});
  cities.addCity('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7});
  cities.addCity('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6});
  cities.addCity('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3});
  cities.addCity('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3});

  // Mencetak daftar kota dan tetangga
  cities.printCities();

  // Membuat objek TSP dan mencari jalur terpendek
  TSP tsp = TSP(cities);
  tsp.findShortestPath();
}
