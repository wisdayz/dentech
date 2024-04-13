import 'package:dentech/screens/aboutus_screen.dart';
import 'package:dentech/screens/reservation_screen.dart';
import 'package:dentech/screens/chats_screen.dart';
import 'package:dentech/screens/login_screen.dart';
import 'package:dentech/screens/profile_screen.dart';
import 'package:dentech/screens/news_screen.dart';
import 'package:dentech/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:dentech/utils/constants.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:dentech/screens/home_screen.dart';


var menus = [
  FeatherIcons.home,
  FeatherIcons.messageCircle,
  FeatherIcons.settings,
  FeatherIcons.user
];
var selectedMenu = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/news-screen': (context) => NewsScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MainScreen(),
    ));
  }

  void _navigateToAboutUsScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AboutusScreen(),
    ));
  }

  void _navigateToNews(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsScreen(),
    ));
  }

  void _navigateToReservasiScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ReservasiScreen(),
    ));
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "DenTech",
          style: appName.copyWith(fontSize: 30),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profil.png'),
                    backgroundColor: Color.fromARGB(255, 0, 68, 87),
                  ),
                  const SizedBox(height: 13),
                  Text('Wisda', style: textNormal2),
                ],
              ),
            ),
            ListTile(
              title: const Text('Beranda'),
              onTap: () {
                _navigateToHomeScreen(context);
              },
            ),
            ListTile(
              title: const Text('Tentang Kami'),
              onTap: () {
                _navigateToAboutUsScreen(context);
              },
            ),
            ListTile(
              title: const Text('Latihan API'),
              onTap: () {
                _navigateToNews(context);
              },
            ),
            ListTile(
              title: const Text('Latihan CRUD SQLITE'),
              onTap: () {
                _navigateToReservasiScreen(context);
              },
            ),
            ListTile(
              title: const Text('Keluar'),
              onTap: () {
                _navigateToLoginScreen(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        selectedItemColor: const Color.fromARGB(255, 0, 68, 87),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedMenu,
        onTap: (int index) {
          setState(() {
            selectedMenu = index;
            if (index == 0) {
              _navigateToHomeScreen(context);
            } else if (index == 1) {
            } else if (index == 2) {
            }
          });
        },
        items: menus
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e),
                label: _getLabel(e),
              ),
            )
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
      ),
      body: _getPage(selectedMenu),
    );
  }

  String _getLabel(IconData icon) {
    if (icon == FeatherIcons.home) {
      return 'Home';
    } else if (icon == FeatherIcons.messageCircle) {
      return 'Messages';
    } else if (icon == FeatherIcons.settings) {
      return 'Settings';
    } else if (icon == FeatherIcons.user) {
      return 'User';
    } else {
      return '';
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ChatsScreen();
      case 2:
        return SettingsScreen();
      case 3:
      default:
        return ProfileScreen();
    }
  }
}
