import 'dart:io';

void main() 
{
    List<String> belanjaan = [];
    List<double> harga = [];

    print('==== Kasir Adel ====');

    stdout.write('Masukkan jumlah barang:');
    int jumlahBarang = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < jumlahBarang; i++) 
    {
        print('\nBarang ke-${i + 1}');

        stdout.write('Nama Barang:');
        String namaBarang = stdin.readLineSync()!;

        stdout.write('Harga Barang:');
        double hargaBarang = double.parse(stdin.readLineSync()!);

        belanjaan.add(namaBarang);
        harga.add(hargaBarang);
    }

    double total = hitungTotal(harga);
    double diskon = hitungDiskon(total);
    double totalAkhir = total - diskon;

    print('\n===== Struk Belanja =====');

    for (int i = 0; i < jumlahBarang; i++) 
    {
        print('${belanjaan[i]} : Rp${harga[i].toStringAsFixed(0)}');
    }

    print('------------------------');
    print('Total Belanja : Rp${total.toStringAsFixed(0)}');
    print('Diskon : Rp${diskon.toStringAsFixed(0)}');
    print('Total Akhir : Rp${totalAkhir.toStringAsFixed(0)}');
}

double hitungTotal(List<double> harga) 
{
    double total = 0;
    for (double h in harga) 
    {
        total += h;
    }

    return total;
}

double hitungDiskon(double total) 
{
    if (total >= 100000) 
    {
        return total * 0.1; // Diskon 10%
    } 
    else if (total >= 50000) 
    {
        return total * 0.05; // Diskon 5%
    } 
    else 
    {
        return 0; // Tidak ada diskon
    }
}