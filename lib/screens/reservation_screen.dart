import 'package:dentech/screens/reservationlist.dart';
import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dentech/dto/book.dart';
import 'package:dentech/services/dbhelper.dart';

class ReservasiScreen extends StatefulWidget {
  @override
  _ReservasiScreenState createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<ReservasiScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reservasi Dokter Gigi',
          style: textNormal.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0), 
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: textNormal,
                fillColor: Colors.white, 
                filled: true, 
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor), 
                ),
              ),
              style: textNormal, 
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                labelText: 'Alamat',
                labelStyle: textNormal,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor)
                ),
              ),
              style: textNormal,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: textNormal,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor), 
                ),
              ),
              style: textNormal,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _jamController,
              decoration: InputDecoration(
                labelText: 'Jam',
                labelStyle: textNormal,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
              ),
              style: textNormal,
            ),
            SizedBox(height: 16.0),
           Center(
  child: ElevatedButton(
    onPressed: () {
      _tambahReservasi();
    },
    child: Text(
      'Tambah Reservasi',
      style: textNormal,
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: buttonColor),
      ),
    ),
  ),
),


          ],
        ),
      ),
    );
  }

  Future<void> _tambahReservasi() async {
    final String nama = _namaController.text;
    final String alamat = _alamatController.text;
    final String tanggal = _tanggalController.text;
    final String jam = _jamController.text;

    if (nama.isEmpty || alamat.isEmpty || tanggal.isEmpty || jam.isEmpty) {
      return;
    }

    final Book reservasi = Book(nama: nama, alamat: alamat, tanggal: tanggal, jam: jam);
    final db = await DbHelper.instance.database;
    await db.insert('reservasi', reservasi.toMap());

    // Setelah menambahkan reservasi, navigasi ke ReservasiListScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ReservasiListScreen()),
    );

    setState(() {
      _namaController.clear();
      _alamatController.clear();
      _tanggalController.clear();
      _jamController.clear();
    });
  }
}
