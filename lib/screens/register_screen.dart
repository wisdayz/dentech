import 'package:dentech/components/asset_image_widget.dart';
import 'package:dentech/main.dart';
import 'package:dentech/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dentech/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AssetImageWidget(
                      imagePath: 'assets/images/appLogo.png',
                      width: 130,
                      height: 175,
                    ),
                    Text(
                      "Daftar",
                      style: appName.copyWith(fontSize: 36),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      style: textNormal,
                      decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        hintStyle: textNormal,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      style: textNormal,
                      decoration: InputDecoration(
                        hintText: 'Alamat email',
                        hintStyle: textNormal,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      style: textNormal,
                      decoration: InputDecoration(
                        hintText: 'No. Hp',
                        hintStyle: textNormal,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
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
                    SizedBox(height: 5),
                    TextFormField(
                      style: textNormal,
                      decoration: InputDecoration(
                        hintText: 'Konfirmasi kata sandi',
                        hintStyle: textNormal,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman utama setelah login berhasil
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: textNormal,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Sudah punya akun? Masuk di sini',
                        style: textNormal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
