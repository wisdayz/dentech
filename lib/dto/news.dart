//merepresentasikan entitas news
class News {
  final String id;
  final String title;
  final String body;

  News({required this.id, required this.title, required this.body});

  //mengambil data dari API yg menyediakan data dalam format JSON
  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
