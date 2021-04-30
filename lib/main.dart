import 'package:flutter/material.dart';
import 'package:saglik/Screen/SignUp/signup.dart';
import 'package:saglik/Screen/hakkinda.dart';
import 'Screen/Home/home.dart';
import 'Screen/Home/words.dart';
import 'customwidget/mybutton.dart';
import 'Screen/Login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Wellcome(),
    );
  }
}

class Wellcome extends StatefulWidget {
  @override
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
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
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
            const SizedBox(height: 256.0),

            Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 128),
                child: Text("HOŞGELDİNİZ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                  ),
                )),
            const SizedBox(height: 128.0),
             MyButton(
          text: "Giriş Yap",
          onCustomButtonPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(Icons.account_circle_outlined, color: Colors.white,),
        ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: MyButton(
                text: "Kayıt Ol",
                onCustomButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                },
                icon: Icon(
                  Icons.supervisor_account_outlined, color: Colors.white,),
              ),
            ),
            MyButton(
                text: "Uygulama Hakkında",
                onCustomButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));
                },
                icon: Icon(Icons.info_outline_rounded))

        ],

      ),
    )),
    );
  }
}