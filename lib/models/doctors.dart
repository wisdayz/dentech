import 'package:dentech/models/services.dart';

//struktur data untuk merepresentasikan dokter & informasinya
class DoctorModel {
  String name;
  String image;
  List<String> services;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.services,
      required this.distance});
}

var doctors = [
  DoctorModel(
      name: "drg. Hilda S. Juliawan ",
      image: "drg.hilda.png",
      services: [Service.scalling, Service.behel],
      distance: 5),
  DoctorModel(
      name: "drg. Surya ",
      image: "drg.surya.png",
      services: [Service.scalling, Service.tambalgigi],
      distance: 10),
  DoctorModel(
      name: "drg. I Gd Pt Surya Dharma Putra ",
      image: "drg.dharma.png",
      services: [Service.cabutgigi, Service.scalling],
      distance: 15)
];