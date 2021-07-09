import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saglik/Screen/Home/home.dart';
import 'package:saglik/Screen/Profile/friends.dart';
import 'package:saglik/customwidget/mybutton.dart';

var sozler = [
  'Herkese kulağını, ama çok azına sesini ver.',
  'Mutlu olmanın en garantili yolu bir başkasını mutlu etmektir.',
  'Her şeyin en mühim noktası, başlangıçtır.',
  'Umut, uyanık adamın rüyasıdır.',
  'Dünden öğrenin, bugün için yaşayın, yarın için ümit edin.',
  'Hiç kimse, görmek istemeyen kadar kör değildir.',
  'Doğa acele etmez, yine de her şeyi başarır.',
  'İnsanlar arkanızdan konuşuyorsa, onlardan öndesiniz demektir.',
  'En iyisini sonraya saklamayın. Yarının ne getireceğini bilemezsiniz.',
];

class WordsPage extends StatefulWidget {
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  String text =
      "Yorma kendini... Bırak hayatına eşlik etmek isteyenler seninle gelsin.";
  String wordImg = "assets/images/wordbackground.png";
  String wordImg2 = "assets/images/wordbackground2.png";
  String img = "assets/images/wordbackground.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "GÜNÜN SÖZLERİ",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 36,
                fontFamily: "Poppins"),
          ),
          const SizedBox(height: 72),
          GestureDetector(
            child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    )),
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            onTap: () {
              setState(() {
                Random random = Random();
                text = sozler[random.nextInt(9)];
              });
            },
            onLongPress: (){
              setState(() {

              });
              if(img == wordImg)
                img = wordImg2;
              else
                img = wordImg;
            },
          ),
          const SizedBox(height: 32),
          Text(
            "Sözleri değiştirmek için resime tıklayın.",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontFamily: "Poppins",fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 32),
          MyButton(text: "Anasayfaya Git", onCustomButtonPressed: (){
            int friends;
            var data = [];
            data = ModalRoute.of(context).settings.arguments;
            friends = data.length;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                  settings: RouteSettings(arguments: data)
                ));
          }, icon: Icon(Icons.home,color: Colors.white))
        ],
      ),
    ));
  }
}
