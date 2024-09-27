void main() {
  // Konsumsi per alat dalam kWh per jam
  const double AC = 1.5;
  const double TV = 0.2;
  const double Lampu = 0.1;

  // Jam penggunaan
  const int jamAC = 8;
  const int jamTV = 5;
  const int jamLampu = 12;

  // Menghitung konsumsi energi harian
  double totalKonsumsi = (AC * jamAC) + (TV * jamTV) + (Lampu * jamLampu);

  // Menampilkan hasil
  print('Total konsumsi energi harian: ${totalKonsumsi} kWh');
}
