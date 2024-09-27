void main() {
  const int jumMesinCuci = 3;
  const int waktuPerMesin = 2;
  const double waktuPerPenghuni = 1.5;

  // Menghitung total waktu yang tersedia
  int totalWaktuTersedia = jumMesinCuci * waktuPerMesin;

  // Menghitung jumlah penghuni yang dapat mencuci
  double jumlahEfisienPenghuniMencuci = (totalWaktuTersedia / waktuPerPenghuni);

   // Menampilkan hasil
  print('Jumlah penghuni yang dapat mencuci di hari yang sama: $jumlahEfisienPenghuniMencuci');

  // Menampilkan jadwal penggunaan mesin cuci menggunakan switch
  switch (jumlahEfisienPenghuniMencuci) {
    case 1:
      print('Mesin Cuci 1: Penghuni 1: 00:00 - 01:30');
      break;
    case 2:
      print('Mesin Cuci 1: Penghuni 1: 00:00 - 01:30');
      print('Mesin Cuci 2: Penghuni 2: 00:00 - 01:30');
      break;
    case 3:
      print('Mesin Cuci 1: Penghuni 1: 00:00 - 01:30');
      print('Mesin Cuci 2: Penghuni 2: 00:00 - 01:30');
      print('Mesin Cuci 3: Penghuni 3: 01:30 - 03:00');
      break;
    case 4:
      print('Mesin Cuci 1: Penghuni 1: 00:00 - 01:30');
      print('Mesin Cuci 2: Penghuni 2: 00:00 - 01:30');
      print('Mesin Cuci 3: Penghuni 3: 01:30 - 03:00');
      print('Mesin Cuci 1: Penghuni 4: 01:30 - 03:00');
      break;
    default:
      print('Tidak ada penghuni yang dapat mencuci hari ini.');
  }
}
