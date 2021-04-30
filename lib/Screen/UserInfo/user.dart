import 'package:flutter/material.dart';
import 'package:saglik/Screen/UserInfo/feel.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/userinfo.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String selectedGender;
  String ageText = "YAŞ\n 20";
  var maleSize = 64.0;
  var femaleSize = 64.0;
  double _value = 20;

  void GenderSelect(String gender) {
    if (gender == "male") {
      maleSize = 72.0;
      femaleSize = 48.0;
    } else if (gender == "female") {
      femaleSize = 72.0;
      maleSize = 48.0;
    }
    selectedGender = gender;
  }

  void GetData(double age){
    var userData = [];
    userData = ModalRoute.of(context).settings.arguments;
    User user = User();
    user.gender = selectedGender.toString();
    user.age = int.parse(age.round().toString());
    userData.add(user.gender);
    userData.add(user.age);
    if(selectedGender == null){
      final snackBar = SnackBar(
        content: Text('Cinsiyetinizi belirtiniz!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeelPage(),
            settings: RouteSettings(arguments: userData),
          ));
    }
  }
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("ÜYE BİLGİLERİ",style: TextStyle(color: Colors.white60,fontSize: 36,fontFamily: "Poppins"),)
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: maleSize,
                    child: Image.asset('assets/images/male.png'),
                  ),
                  onTap: () {
                    setState(() {
                      GenderSelect("male");
                    });
                  },
                ),
                const SizedBox(width: 36),
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: femaleSize,
                    child: Image.asset('assets/images/female.png'),
                  ),
                  onTap: () {
                    setState(() {
                      GenderSelect("female");
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              Text(
                ageText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60),
              ),
              Container(
                width: 300,
                child: Slider(
                  min: 0,
                  max: 100,
                  value: _value,
                  label: _value.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                      ageText = "YAŞ\n " + _value.round().toString();
                    });
                  },
                ),
              ),
              //const SizedBox(height: 64),
              MyButton(
                  text: "Kaydet",
                  onCustomButtonPressed: () {
                    setState(() {
                      GetData(_value);
                    });
                  },
                  icon: Icon(Icons.all_inclusive_outlined))
            ],
          ))
        ],
      ),
    ));
  }
}
