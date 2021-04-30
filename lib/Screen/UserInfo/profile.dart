import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saglik/Screen/UserInfo/hobies.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:basic_utils/basic_utils.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "", age = "", gender = "", happy = "", health = "";
  String img = "assets/images/female.png";
  var getData = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Data());
    super.initState();
  }

  void Data() {
    getData = ModalRoute.of(context).settings.arguments;
    name = StringUtils.capitalize(getData[0].toString());
    age = getData[5].toString();
    gender = getData[4].toString();
    happy = StringUtils.capitalize(getData[6].toString());
    health = StringUtils.capitalize(getData[7].toString());
    if (gender == "male") {
      img = "assets/images/male.png";
    } else if (gender == "female") {
      img = "assets/images/female.png";
    }
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
          const SizedBox(
            height: 64.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 72,
            child: Image.asset(img),
          ),
          Text(
            name + "\n" "Yaş " + age + "\n" + happy + " ve " + health,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontFamily: "Poppins"),
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
                        value: 0.8,
                      ))),
                  ),
                  Center(child: Text("Profil Doluluğu\n%80",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold ,color: Colors.white, fontFamily: "Poppins"))),
                ],
              )),
          const SizedBox(
            height: 64,
          ),
          MyButton(text: "Profili Tamamla", onCustomButtonPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HobiesPage(),
                  settings: RouteSettings(arguments: getData),
                ));
          }, icon: Icon(Icons.add))
        ],
      ),
    ));
  }
}
