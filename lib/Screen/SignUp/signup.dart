import 'package:flutter/material.dart';
import 'package:saglik/Screen/Login/login.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/customwidget/mydigitfield.dart';
import 'package:saglik/customwidget/mytextfield.dart';
import 'package:saglik/userinfo.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final numberController = TextEditingController();

  void addUser(User user) {
    var data = [];
    data.add(user.name);
    data.add(user.email);
    data.add(user.pass);
    data.add(user.number);
    for (int i = 0; i < 4; i++) {
      if (data[i].toString().length == 0) {
        final snackBar = SnackBar(
          content: Text('Lütfen bilgilerinizi eksiksiz giriniz!'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
              settings: RouteSettings(arguments: data),
            ));
      }
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
                    padding: EdgeInsets.all(32),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset('assets/images/useradd.png'),
                    ),
                  ),
                  MyTextField(
                      "İsminiz", false, nameController, Icons.account_circle),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: MyTextField("Email adresiniz", false,
                          emailController, Icons.mail_outline_outlined)),
                  MyTextField(
                      "Şifreniz", true, passController, Icons.vpn_key_outlined),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: MyDigitField("Telefon numaranız", false,
                          numberController, Icons.phone_android_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: MyButton(
                        text: "Kayıt Ol",
                        onCustomButtonPressed: () {
                          User user = User();
                          user.name = nameController.text;
                          user.email = emailController.text;
                          user.pass = passController.text;
                          user.number = double.parse(numberController.text);
                          addUser(user);
                        },
                        icon: Icon(Icons.add)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                          "Zaten üye misiniz? Buraya tıklayarak giriş yapın.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60))),
                ],
              ),
            ))));
  }
}
