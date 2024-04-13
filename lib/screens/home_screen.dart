import 'package:dentech/screens/reservation_screen.dart';
import 'package:dentech/utils/constants.dart';
import 'package:dentech/models/doctors.dart';
import 'package:dentech/models/services.dart';
import 'package:dentech/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.messageCircle,
  FeatherIcons.settings,
  FeatherIcons.user
];
var selectedMenu = 0;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedService = 0;
  var menus = [
    FeatherIcons.home,
    FeatherIcons.messageCircle,
    FeatherIcons.settings,
    FeatherIcons.user
  ];
  var selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _greetings(),
              const SizedBox(
                height: 16,
              ),
              _card(),
              const SizedBox(
                height: 20,
              ),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(
                height: 27,
              ),
              _doctors(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _doctors() {
  // filter dokter berdasarkan layanan
  List<DoctorModel> filteredDoctors = doctors.where((doctor) => doctor.services.contains(Service.all()[selectedService])).toList();

  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) => _doctor(filteredDoctors[index]),
    separatorBuilder: (context, index) => const SizedBox(
      height: 11,
    ),
    itemCount: filteredDoctors.length,
  );
}


GestureDetector _doctor(DoctorModel doctors) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReservasiScreen()),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/${doctors.image}',
              width: 88,
              height: 103,
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors.name,
                  style: textNormal.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 7),
                RichText(
                  text: TextSpan(
                    text: "Layanan: ${doctors.services.join(', ')}",
                    style: textNormal.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "${doctors.distance}km",
                      style: textNormal.copyWith(
                        fontSize: 12,
                        color: const Color(0xFFACA3A3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      "Buka sekarang",
                      style: textNormal.copyWith(
                        color: const Color(0xFF50CC98),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


 SizedBox _services() {
    final List<String> allServices = Service.all();
    final List<String> uniqueServices = allServices.toSet().toList();
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final String currentService = uniqueServices[index];
          final bool isSelected = selectedService == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedService == index) {
                  selectedService = -1;
                } else {
                  selectedService = index;
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? textFormColor : null,
              ),
              child: Center(
                child: Text(
                  currentService,
                  style: textNormal.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : const Color(0xFF3F3E3F).withOpacity(.3),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: uniqueServices.length,
      ),
    );
  }
}

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: buttonColor,
          width: 2,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              FeatherIcons.search,
              color: textFormColor,
            ),
            hintText: "Cari dokter, perawatan, ...",
            hintStyle: textNormal.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textFormColor,
                height: 150 / 100)),
      ),
    );
  }

AspectRatio _card() {
  return AspectRatio(
    aspectRatio: 336 / 184,
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: textFormColor,
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/dokter_atas.png',
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Jadwal ",
                    style: textNormal.copyWith(
                      fontSize: 16,
                      color: const Color(0xFFDEE1FE),
                      height: 150 / 100,
                    ),
                    children: const [
                      TextSpan(
                        text: "periksa ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(text: "anda\n(scaling) "),
                      TextSpan(
                        text: "besok \npukul 08.00 WITA!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                          color: Colors.white.withOpacity(.12),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "See details",
                        style: textNormal.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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


  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Halo, Wisda!',
            style: textNormal.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w800,),
          ),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.shoppingBag,
                  color: secondaryTextColor,
                )),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: const Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(15 / 2)),
                child: Center(
                    child: Text(
                  "2",
                  style: textNormal.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800),
                )),
              ),
            )
          ])
        ],
      ),
    );
  }

