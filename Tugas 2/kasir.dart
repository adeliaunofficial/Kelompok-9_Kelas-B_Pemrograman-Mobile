void main() {
  // 01. Menyimpan daftar harga
  Map<String, int> daftarHarga = {
    'Beras': 12000,
    'Minyak Goreng': 18000,
    'Gula': 15000,
    'Telur': 27000,
    'Susu': 20000,
  };

  // 02. Menyimpan daftar belanjaan
  List<String> daftarBelanjaan = ['Beras', 'Minyak Goreng', 'Telur', 'Susu'];

  print('=== DAFTAR HARGA ===');
  daftarHarga.forEach((barang, harga) {
    print('$barang : Rp$harga');
  });

  print('\n=== DAFTAR BELANJAAN ===');
  for (String barang in daftarBelanjaan) {
    print(barang);
  }

  int totalBelanja = hitungTotalBelanja(daftarBelanjaan, daftarHarga);
  print('\nTotal belanja sebelum diskon: Rp$totalBelanja');

  // 03. Menentukan case diskon belanjaan
  double persenDiskon = tentukanDiskon(totalBelanja);
  int nominalDiskon = (totalBelanja * persenDiskon).round();

  // 04. Menampilkan total akhir belanjaan
  int totalAkhir = totalBelanja - nominalDiskon;

  print(
      'Diskon yang didapat: ${(persenDiskon * 100).toStringAsFixed(0)}% (Rp$nominalDiskon)');
  print('Total akhir belanja: Rp$totalAkhir');
}

// Function untuk menghitung total harga dari daftar belanjaan
int hitungTotalBelanja(List<String> belanjaan, Map<String, int> harga) {
  int total = 0;

  for (String barang in belanjaan) {
    if (harga.containsKey(barang)) {
      total += harga[barang]!;
    }
  }

  return total;
}

// Function untuk menentukan persentase diskon berdasarkan total belanja
double tentukanDiskon(int total) {
  double diskon;

  if (total >= 100000) {
    diskon = 0.20; // diskon 20% untuk belanja >= 100.000
  } else if (total >= 50000) {
    diskon = 0.10; // diskon 10% untuk belanja >= 50.000
  } else if (total >= 25000) {
    diskon = 0.05; // diskon 5% untuk belanja >= 25.000
  } else {
    diskon = 0.0; // tidak ada diskon
  }

  return diskon;
}