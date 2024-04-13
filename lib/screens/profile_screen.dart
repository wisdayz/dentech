import 'package:dentech/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/profil.png'),
              backgroundColor:Color.fromARGB(255, 0, 68, 87),
            ),
            const SizedBox(height: 20),
            itemProfile('Nama', 'Ni Kadek Wisdayani', Icons.person),
            const SizedBox(height: 10),
            itemProfile('No. Hp', '08814814865', Icons.call),
            const SizedBox(height: 10),
            itemProfile('Alamat', 'Kali Untu, Singaraja', Icons.location_on),
            const SizedBox(height: 10),
            itemProfile('Email', 'wisdayani35@gmail.com', Icons.mail),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: buttonColor
                  ),
                  child: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            )
              )
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: buttonColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: buttonColor),
      ),
    );
  }
}