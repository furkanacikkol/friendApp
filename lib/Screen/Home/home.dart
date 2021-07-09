import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saglik/Screen/Home/graphics.dart';
import 'package:saglik/Screen/Home/words.dart';
import 'package:saglik/Screen/UserInfo/profilepic.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/customwidget/myclipper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getData = [];
  int fridens;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Data());
    super.initState();
  }

  void Data() {
    getData = ModalRoute.of(context).settings.arguments;
    fridens = getData.length;
    setState(() {});
  }

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
              children: <Widget>[
                GestureDetector(
                  child: MyClipper(),
                  onLongPressEnd: (details) {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        title: const Text('Profil Fotoğrafı'),

                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: const Text('Galeriden Seç'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilPicPage(),
                                  ));
                            },
                          ),

                        ],
                      ),
                    );
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilPicPage(),
                        ));*/
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        width: 150,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white38),
                        child: Center(
                          child: Text(
                            "Takip\n" + fridens.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Poppins",
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Container(
                        width: 150,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white38),
                        child: Center(
                          child: Text(
                            "Takipçi\n0",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Poppins",
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                    height: 200.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                              width: 200.0,
                              height: 200.0,
                              child: (CircularProgressIndicator(
                                strokeWidth: 15,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                                backgroundColor: Colors.white,
                                value: 1,
                              ))),
                        ),
                        Center(
                            child: Text("Profil\n Tamamlandı",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poppins"))),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                MyButton(
                    text: "Kullanıcı Cinsiyet Grafiği",
                    onCustomButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GraphicsPage(),
                          ));
                    },
                    icon: Icon(Icons.graphic_eq_rounded, color: Colors.white)),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            width: 150,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white38),
                            child: Center(
                                child: GestureDetector(
                              child: Text(
                                "Günün sözleri için tıklayın",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Poppins",
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WordsPage(),
                                      settings:
                                          RouteSettings(arguments: getData),
                                    ));
                              },
                            ))))),
              ],
            )));
  }
}
