import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saglik/Screen/UserInfo/user.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/customwidget/mytextfield.dart';
import 'package:saglik/Screen/SignUp/signup.dart';
import 'package:saglik/userinfo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 64.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 64, 0, 16),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset('assets/images/users.png'),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 32, 0, 8),
                      child: MyTextField("Email adresiniz", false,
                          emailController, Icons.mail_outline_outlined)),
                  MyTextField(
                      "Şifreniz", true, passController, Icons.vpn_key_outlined),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: MyButton(
                        text: "Giriş Yap",
                        onCustomButtonPressed: () {
                          _signInWithEmailAndPassword();
                        },
                        icon: Icon(Icons.add,color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                            "Üye değil misiniz? Buraya tıklayarak kayıt olun.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white60))),
                  )
                ],
              ),
            ))));
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      ))
          .user;

      //if (user != null) {
      setState(() {
        print("giriş başarılı");
        final snackBar = SnackBar(
          content: Text('Giriş başarılı!'),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        var getData = [];
        getData = ModalRoute.of(context).settings.arguments;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
              settings: RouteSettings(arguments: getData),
            ),
            (route) => route.isFirst);
      });
      /* } else if(error.Code) {
        setState(() {
          print("giriş başarısız");
          final snackBar = SnackBar(
            content: Text('Giriş bilgileriniz yanlış!'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }*/
    } catch (e) {
      //print(e.message);   // On this line, call your class and show the error message.
      switch (e.message) {
        case "There is no user record corresponding to this identifier. The user may have been deleted.":
          final snackBar = SnackBar(
            content: Text('Giriş bilgileriniz yanlış!'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        case 'The password is invalid or the user does not have a password.':
          final snackBar = SnackBar(
            content: Text('Giriş bilgileriniz yanlış!'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;

        default:
          print("Hata");
          break;
      }
    }
  }
}
