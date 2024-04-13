import 'package:dentech/screens/reservasiedit_screen';
import 'package:flutter/material.dart';
import 'package:dentech/dto/book.dart';
import 'package:dentech/services/dbhelper.dart';
import 'package:dentech/utils/constants.dart'; 

class ReservasiListScreen extends StatefulWidget {
  @override
  _ReservasiListScreenState createState() => _ReservasiListScreenState();
}

class _ReservasiListScreenState extends State<ReservasiListScreen> {
  List<Book> _reservasiList = [];

  @override
  void initState() {
    super.initState();
    _ambilReservasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Reservasi'),
        backgroundColor: bgColor, 
      ),
      backgroundColor: bgColor, 
      body: _buildReservasiList(),
    );
  }

  Widget _buildReservasiList() {
    if (_reservasiList.isEmpty) {
      return Center(
        child: Text(
          'Belum ada reservasi.',
          style: textNormal,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _reservasiList.length,
        itemBuilder: (context, index) {
          final reservasi = _reservasiList[index];
          return ListTile(
            title: Text(
              reservasi.nama,
              style: textNormal,
            ),
            subtitle: Text(
              '${reservasi.tanggal} - ${reservasi.jam}',
              style: textNormal, 
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editReservasi(reservasi);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _hapusReservasi(reservasi);
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> _ambilReservasi() async {
    final db = await DbHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('reservasi');
    setState(() {
      _reservasiList = List.generate(maps.length, (index) {
        return Book.fromMap(maps[index]);
      });
    });
  }

  void _editReservasi(Book reservasi) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReservasiEditScreen(reservasi: reservasi)),
    ).then((value) {
      if (value != null && value) {
        _ambilReservasi(); 
      }
    });
  }

  void _hapusReservasi(Book reservasi) async {
    final db = await DbHelper.instance.database;
    await db.delete(
      'reservasi',
      where: 'id = ?',
      whereArgs: [reservasi.id],
    );
    _ambilReservasi(); 
  }
}
