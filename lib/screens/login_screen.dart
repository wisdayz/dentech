import 'package:dentech/components/asset_image_widget.dart';
import 'package:dentech/main.dart';
import 'package:dentech/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:dentech/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

//gambar latar belakang
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(                                                  //jika child melebihi ukuran layar
        child: Stack(                                                               //stack> menempatkan widget dlm tumpukan
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,                                                //gambar meliputi area secara proporsional tanpa merubah aspek rasio gambar
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 40),   // padding simetris di sekitar widget
              child: Column(
                children: [
                  const AssetImageWidget(
                    imagePath: 'assets/images/appLogo.png',
                    width: 130,
                    height: 175,
                  ),
                  Text(
                    "DenTech",
                    style: appName.copyWith(fontSize: 36),
                  ),
                  SizedBox(height: 30),                                           //menentukan ruang kosong antara widget-widget sebelum dan sesudahnya
                  TextFormField(
                    style: textNormal,
                    decoration: InputDecoration(
                      hintText: 'Alamat email',                                   //label sementara yg ditampilkan ketika bidang input teks kosong
                      hintStyle: textNormal,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,                                               
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: textNormal,
                    decoration: InputDecoration(
                      hintText: 'Kata sandi',
                      hintStyle: textNormal,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman utama setelah login berhasil
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: textNormal,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // navigasi ke hlm registrasi
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Belum punya akun? Daftar di sini',
                      style: textNormal, 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
