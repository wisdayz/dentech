//merepresentasikan entitas reservasi
class Book {
  int? id;
  String nama;
  String alamat;
  String tanggal;
  String jam;

  Book({this.id, required this.nama, required this.alamat, required this.tanggal, required this.jam});

//menyimpan data ke dalam db
  Map<String, dynamic> toMap() {                           
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'tanggal': tanggal,
      'jam': jam,
    };
  }

//mengambil data dari db
  factory Book.fromMap(Map<String, dynamic> map) {          
    return Book(
      id: map['id'],
      nama: map['nama'],
      alamat: map['alamat'],
      tanggal: map['tanggal'],
      jam: map['jam'],
    );
  }
}
