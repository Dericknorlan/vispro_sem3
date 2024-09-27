void main() {
  // Kapasitas baterai awal
  int kapasitasBaterai = 100;

  // Menghitung pengurangan baterai untuk masing-masing aplikasi
  int chattingTime = 60; // dalam menit
  int videoTime = 30;    // dalam menit
  int gameTime = 45;     // dalam menit

  // Menghitung total pengurangan baterai
  int penguranganBateraiChatting = (chattingTime / 5).floor() * 1; // 1% setiap 5 menit
  int penguranganBateraiVideo = (videoTime / 5).floor() * 2;       // 2% setiap 5 menit
  int penguranganBateraiGame = (gameTime / 5).floor() * 3;         // 3% setiap 5 menit

  // Total pengurangan baterai
  int totalPengurangan = penguranganBateraiChatting + penguranganBateraiVideo + penguranganBateraiGame;

  // Menghitung sisa baterai
  int sisaBaterai = kapasitasBaterai - totalPengurangan;

  // Menampilkan hasil
  print('Sisa baterai setelah penggunaan: $sisaBaterai%');
}
