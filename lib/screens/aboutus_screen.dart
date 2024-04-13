import 'package:flutter/material.dart';
import 'package:dentech/utils/constants.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Tentang DenTech',
          style: appName.copyWith(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DenTech adalah sebuah aplikasi untuk membantu Anda dalam mencari dokter dan layanan kesehatan terbaik di sekitar Anda. Dengan fitur-fitur yang lengkap dan mudah digunakan, DenTech siap menjadi mitra kesehatan Anda.',
                style: textNormal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}