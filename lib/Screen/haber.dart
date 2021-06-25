import 'package:flutter/material.dart';
import 'package:saglik/customwidget/customListTile.dart';
import 'package:saglik/Models/article_model.dart';
import 'package:saglik/Services/api_service.dart';



class HaberPage extends StatefulWidget {
  @override
  _HaberPageState createState() => _HaberPageState();
}

class _HaberPageState extends State<HaberPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        //future: client(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) => customListTile(articles[index], context)
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}