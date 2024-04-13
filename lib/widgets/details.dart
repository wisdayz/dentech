import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Detail',
          style: appName.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Nama Pasien:',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Wisda',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Tanggal Pemeriksaan:',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '12 April 2024',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Jam Pemeriksaan:',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '08.00 - 10.00',
                style: textNormal.copyWith(
                  fontSize: 16,
                ))  ),
                Divider(),
            ListTile(
              title: Text(
                'Tempat Pemeriksaan:',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'drg. Surya',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Divider(),
            // Tambahkan detail pemeriksaan lainnya di sini
          ],
        ),
      ),
    );
  }
}
