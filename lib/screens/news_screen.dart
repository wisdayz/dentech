import 'package:flutter/material.dart';
import 'package:dentech/dto/news.dart';
import 'package:dentech/services/data_service.dart';
import 'package:dentech/utils/constants.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> _news;

  @override
  void initState() {
    super.initState();
    _news = DataService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        titleTextStyle: textNormal.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      body: Center(
        child: FutureBuilder<List<News>>(
          future: _news,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final news = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      news.title,
                      style: textNormal.copyWith(fontWeight: bold),
                    ),
                    subtitle: Text(
                      news.body,
                      style: textNormal,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: buttonColor),
                          onPressed: () {
                            _showEditNewsDialog(context, news);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: buttonColor),
                          onPressed: () {
                            _deleteNews(news.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    _showAddNewsDialog(context);
  },
  backgroundColor: buttonColor,
  child: const Icon(
    Icons.add,
    color: Colors.white,
  ),
),

    );
  }

  void _showAddNewsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String body = '';
        return AlertDialog(
          title: Text('Add News', style: textNormal),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textNormal,
                ),
              ),
              TextField(
                onChanged: (value) {
                  body = value;
                },
                decoration: InputDecoration(
                  labelText: 'Body',
                  labelStyle: textNormal,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _addNews(title, body);
                Navigator.of(context).pop();
              },
              child: Text('Add', style: TextStyle(color: buttonColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: buttonColor)),
            ),
          ],
        );
      },
    );
  }

  void _showEditNewsDialog(BuildContext context, News news) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedTitle = news.title;
        String editedBody = news.body;
        return AlertDialog(
          title: Text('Edit News', style: textNormal),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  editedTitle = value;
                },
                controller: TextEditingController(text: news.title),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textNormal,
                ),
              ),
              TextField(
                onChanged: (value) {
                  editedBody = value;
                },
                controller: TextEditingController(text: news.body),
                decoration: InputDecoration(
                  labelText: 'Body',
                  labelStyle: textNormal,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _editNews(news.id, editedTitle, editedBody);
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextStyle(color: buttonColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: buttonColor)),
            ),
          ],
        );
      },
    );
  }

  void _addNews(String title, String body) {
    DataService.createNews(title, body).then((_) {
      setState(() {
        _news = DataService.fetchNews();
      });
    });
  }

  void _editNews(String id, String title, String body) {
    DataService.updateNews(id, title, body).then((_) {
      setState(() {
        _news = DataService.fetchNews();
      });
    });
  }

  void _deleteNews(String id) {
    DataService.deleteNews(id).then((_) {
      setState(() {
        _news = DataService.fetchNews();
      });
    });
  }
}
