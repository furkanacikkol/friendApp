import "package:flutter/material.dart";
import 'package:saglik/Screen/Profile/friends.dart';
import 'package:saglik/Screen/Home/words.dart';
import 'package:saglik/customwidget/mybutton.dart';

class HobiesPage extends StatefulWidget {
  @override
  _HobiesPageState createState() => _HobiesPageState();
}

class _HobiesPageState extends State<HobiesPage> {
  bool v1 = true, v2 = true, v3 = true, v4 = true;
  final List<String> entries = <String>[
    'Futbol',
    'Meditasyon',
    'Yoga',
    'Yürüyüş',
    'Müzik'
  ];


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
                const SizedBox(height: 64),
                Text(
                  "HOBİLERİNİZ",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 36,
                      fontFamily: "Poppins"),
                ),
                const SizedBox(height: 32),
                Expanded(
                    child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.white70,
                      child: Center(
                          child: Text(
                        '${entries[index]}',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: Colors.black54),
                      )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
                const SizedBox(
                  height: 8,
                ),
                Visibility(
                  visible: v1,
                  child: MyButton(
                      text: "Yüzme",
                      onCustomButtonPressed: () {
                        setState(() {
                          entries.add("Yüzme");
                          v1 = false;
                        });
                      },
                      icon: Icon(Icons.plus_one_rounded,color: Colors.white)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Visibility(
                  visible: v2,
                  child: MyButton(
                      text: "Seyahet Etmek",
                      onCustomButtonPressed: () {
                        setState(() {
                          entries.add("Seyahet Etmek");
                          v2 = false;
                        });
                      },
                      icon: Icon(Icons.plus_one_rounded,color: Colors.white)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Visibility(
                  visible: v3,
                  child: MyButton(
                      text: "Fitness",
                      onCustomButtonPressed: () {
                        setState(() {
                          entries.add("Fitness");
                          v3 = false;
                        });
                      },
                      icon: Icon(Icons.plus_one_rounded,color: Colors.white)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Visibility(
                    visible: v4,
                    child: MyButton(
                        text: "Kitap Okuma",
                        onCustomButtonPressed: () {
                          setState(() {
                            entries.add("Kitap Okuma");
                            v4 = false;
                          });
                        },
                        icon: Icon(Icons.plus_one_rounded,color: Colors.white))),
                Align(
                    alignment: Alignment.bottomRight,

                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FriendsPage(),
                                ));
                          },
                          child: const Icon(
                            Icons.save_outlined,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                        )),
                const SizedBox(height: 8)
              ],
            )));
  }
}
