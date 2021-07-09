import 'package:flutter/material.dart';
import 'package:saglik/Screen/Home/home.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/userinfo.dart';


class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<MyUser> users = [
    MyUser.info("Ayşe", "ayse123@hotmail.com", 05394561212, 23, "Kadın", "Mutlu",
        "Hasta", "Yeni arkadaşlıklar edinmek istiyorum"),
    MyUser.info("Furkan", "furkan1903@gmail.com", 05551113322, 21, "Erkek",
        "Mutlu", "Sağlıklı", "Dizi ve filmlere meraklıyım"),
    MyUser.info("Melis", "melis@selcuk.edu.tr", 05991239874, 27, "Kadın",
        "Mutsuz", "Hasta", "Dünyadaki diğer kültürleri öğrenmek istiyorum"),
    MyUser.info("Deniz", "deniz_deniz@outlook.com", 05135123252, 36, "Kadın",
        "Mutlu", "Sağlıklı", "Edebiyat ve tarihe ilgiliyim"),
    MyUser.info("Berk", "berk1453@gmail.com", 05788523641, 16, "Erkek", "Mutsuz",
        "Hasta", "Üniversite sınavına hazırlanıyorum"),
    MyUser.info("İrem", "irem17853@art.com", 05396664545, 45, "Kadın", "Mutlu",
        "Hasta", "Sanata hayran birisiyim"),
    MyUser.info("Can", "can1156684@outlook.com", 0531624563, 35, "Erkek",
        "Mutsuz", "Sağlıklı", "Müzik dinlemeyi severim")
  ];

  List<String> friend = <String>[];

  String text = "Senin için önerilen arkadaşlar";
  bool btn = false;
  String _setImg(String gender) {
    if (gender == "Erkek") {
      return "assets/images/male.png";
    } else if (gender == "Kadın") {
      return "assets/images/female.png";
    }
  }

  int checkLen() {
    if (users.length < 2) {
      text = "Başka öneri kalmadı";
      btn = true;
    }
    return users.length;
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 64),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
                itemCount: checkLen(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      margin: EdgeInsets.all(8),
                      elevation: 20,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(users[index].name +
                            ", " +
                            users[index].age.toString()),
                        subtitle: Text(
                          users[index].info,
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(_setImg(users[index].gender)),
                          radius: 32,
                        ),
                        trailing:Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.done,color: Colors.green,),
                              onPressed: (){
                                setState(() {
                                  friend.add(users[index].name);
                                  users.removeAt(index);
                                  showDialog(context);
                                });                              },
                      ),
                              IconButton(
                                icon: Icon(Icons.close,color: Colors.red,),
                                onPressed: (){
                                  setState(() {
                                    users.removeAt(index);
                                  });
                                  },
                              ),
                          ],
                        ),
                      ));
                }),
          ),
          Visibility(
              visible: btn,
              child:
          MyButton(text: "Devam et", onCustomButtonPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage(),
                  settings: RouteSettings(arguments: friend),
                ),
                    (route) => route.isFirst);
          }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white))),
        ],
      ),
    ));
  }


}

void showDialog(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.purple[800].withOpacity(.75),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 150,
          width: 150,
          child: SizedBox.expand(
              child: Icon(
                Icons.done,
                size: 128,
                color: Colors.green,
              )),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    },
  );

}
