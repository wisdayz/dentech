import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Nota Pembayaran',
          style: appName.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(40), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nota Pembayaran',
              style: textNormal,
            ),
            const SizedBox(height: 20),
            Text(
              'Di sini terdapat Nota Pembayaran.',
              style: textNormal,
            ),
          ],
        ),
      ),
    );
  }
}
