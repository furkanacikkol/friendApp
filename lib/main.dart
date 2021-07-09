import 'package:flutter/material.dart';
import 'package:saglik/Screen/Home/home.dart';
import 'package:saglik/Screen/SignUp/signup.dart';
import 'package:saglik/Screen/Views/create_human.dart';
import 'Screen/Views/list_human.dart';
import 'Screen/weatherloading.dart';
import 'customwidget/mybutton.dart';
import 'Screen/Login/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  String background = "assets/images/background.png";
  String background2 = "assets/images/background2.png";
  String bgTemp = "assets/images/background.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: (){
          setState(() {

          });
          if(bgTemp == background)
            bgTemp = background2;
          else
            bgTemp = background;
        },

      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgTemp),
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
            const SizedBox(height: 100.0),
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
                      text: "Hava durumu",
                      onCustomButtonPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingScreen(),
                            ));
                      },
                      icon: Icon(Icons.wb_cloudy_rounded , color: Colors.white),),
                  SizedBox(height: 10,),
            MyButton(
                text: "Uygulama Hakkında",
                onCustomButtonPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePage()));
                },
                icon: Icon(Icons.info_outline_rounded,color: Colors.white))

        ],

      ),
    )),
    ));
  }
}