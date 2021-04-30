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

  void checkInfo() {
    var getData = [];
    getData = ModalRoute.of(context).settings.arguments;
    if (getData[1].toString() == emailController.text &&
        getData[2].toString() == passController.text) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserPage(),
            settings: RouteSettings(arguments: getData),
          ),
              (route) => route.isFirst);
    } else {
      final snackBar = SnackBar(
        content: Text('Giriş bilgileriniz yanlış!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                          checkInfo();
                        },
                        icon: Icon(Icons.add)),
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
}
