import 'dart:io';

void main() {
  List<String> namaMahasiswa = [];
  List<double> nilaiMahasiswa = [];
  List<int> kehadiranMahasiswa = [];
  List<String> gradeList = [];
  List<String> statusList = [];

  print('==== Student Grade Tracker ====');
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlah; i++) {
    print('\nData Mahasiswa ke-${i + 1}');

    stdout.write('Nama: ');
    String nama = stdin.readLineSync()!;

    stdout.write('Nilai (0-100): ');
    double nilai = double.parse(stdin.readLineSync()!);

    stdout.write('Kehadiran (persen/jumlah hadir): ');
    int kehadiran = int.parse(stdin.readLineSync()!);

    // Menentukan Grade dan Status menggunakan fungsi
    String grade = tentukanGrade(nilai);
    String status = tentukanStatus(nilai, kehadiran);

    namaMahasiswa.add(nama);
    nilaiMahasiswa.add(nilai);
    kehadiranMahasiswa.add(kehadiran);
    gradeList.add(grade);
    statusList.add(status);
  }

  print('\n===== Rekapitulasi Nilai Mahasiswa =====');
  for (int i = 0; i < jumlah; i++) {
    print('----------------------------------------');
    print('Nama      : ${namaMahasiswa[i]}');
    print('Nilai     : ${nilaiMahasiswa[i].toStringAsFixed(1)}');
    print('Kehadiran : ${kehadiranMahasiswa[i]}%');
    print('Grade     : ${gradeList[i]}');
    print('Status    : ${statusList[i]}');
  }
  print('----------------------------------------');
}

// Fungsi untuk menentukan Grade berdasarkan nilai
String tentukanGrade(double nilai) {
  if (nilai >= 85) {
    return 'A';
  } else if (nilai >= 70) {
    return 'B';
  } else if (nilai >= 55) {
    return 'C';
  } else if (nilai >= 40) {
    return 'D';
  } else {
    return 'E';
  }
}

// Fungsi untuk menentukan status kelulusan (syarat: nilai >= 55 dan kehadiran >= 75%)
String tentukanStatus(double nilai, int kehadiran) {
  if (nilai >= 55 && kehadiran >= 75) {
    return 'Lulus';
  } else {
    return 'Tidak Lulus';
  }
}