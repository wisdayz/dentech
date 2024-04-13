import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.all(20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Notifikasi',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Atur preferensi notifikasi',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // nav ke hlm notifikasi
              },
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: buttonColor,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Tema',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Pilih tema aplikasi',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // nav ke hlm tema
              },
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: buttonColor,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bahasa',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Pilih bahasa aplikasi',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // nav ke hlm bahasa
              },
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
