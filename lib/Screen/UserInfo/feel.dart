import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/userinfo.dart';
import 'package:saglik/Screen/UserInfo/profile.dart';
class FeelPage extends StatefulWidget {
  @override
  _FeelPageState createState() => _FeelPageState();
}

enum Mutluluk { mutlu, huzunlu, mutsuz }
enum Saglik { saglikli, hasta}

class _FeelPageState extends State<FeelPage> {

  void SendData(){
    var getData = [];
    getData = ModalRoute.of(context).settings.arguments;
    User user = User();
    user.happy =_character.toString().split('.').last;
    user.health = _health.toString().split('.').last;
    getData.add(user.happy);
    getData.add(user.health);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
          settings: RouteSettings(arguments: getData),
        ));
  }

  Mutluluk _character = Mutluluk.mutlu;
  Saglik _health = Saglik.saglikli;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 72,
            ),
            Text(
              "SAĞLIK",
              style: TextStyle(
                  fontSize: 32, fontFamily: "Poppins", color: Colors.white70),
            ),
            const SizedBox(height: 48,),
            Container(
              width: 225,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white60),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.emoji_emotions_outlined, color: Colors.purple,
                      size: 48,
                    ),
                    ListTile(
                      title: const Text("Mutlu"),
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Radio(
                        value: Mutluluk.mutlu,
                        groupValue: _character,
                        onChanged: (Mutluluk value) {
                          setState(() {
                              _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Hüzünlü"),
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Radio(
                        value: Mutluluk.huzunlu,
                        groupValue: _character,
                        onChanged: (Mutluluk value) {
                          setState(() {
                              _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Mutsuz"),
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Radio(
                        value: Mutluluk.mutsuz,
                        groupValue: _character,
                        onChanged: (Mutluluk value) {
                          setState(() {
                              _character = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ), //Mutluluk Container
            const SizedBox(height: 64,),
            Container(
              width: 225,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white60),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_rounded,color: Colors.red,
                      size: 48,
                    ),
                    ListTile(
                      title: const Text("Sağlıklı"),
                      visualDensity:
                      VisualDensity(horizontal: -4, vertical: -4),
                      leading: Radio(
                        value: Saglik.saglikli,
                        groupValue: _health,
                        onChanged: (Saglik value) {
                          setState(() {
                              _health = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text("Hasta"),
                      visualDensity:
                      VisualDensity(horizontal: -4, vertical: -4),
                      leading: Radio(
                        value: Saglik.hasta,
                        groupValue: _health,
                        onChanged: (Saglik value) {
                          setState(() {
                              _health = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ), //Sağlık Container
            const SizedBox(height: 32,),
            MyButton(text: "Kaydet", onCustomButtonPressed: (){
              SendData();
            }, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
