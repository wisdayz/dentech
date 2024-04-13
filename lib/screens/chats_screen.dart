import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'drg. Hilda S. Juliawan',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Dokter Gigi',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: buttonColor,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // navigasi ke chat
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'drg. Surya',
                style: textNormal.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Dokter Gigi',
                style: textNormal.copyWith(
                  fontSize: 16,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: buttonColor,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // ntar nambah navigasi ke chat
              },
            ),
          ],
        ),
      ),
    );
  }
}
