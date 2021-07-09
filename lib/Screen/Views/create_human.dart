import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:saglik/Models/human.dart';
import 'package:saglik/customwidget/mybutton.dart';
import 'package:saglik/customwidget/mytextfield.dart';
import 'package:sqflite/sqflite.dart';
import 'list_human.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future<Database> database;


  List<Human> humanList = [];

  Future<Database> initializeDb() async {
    String path=join(await getDatabasesPath(), 'human_database.db');
    var dbDogs = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbDogs;
  }


  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE humans(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  }
  _onPressedUpdate() async {
    final test = Human(
      id: int.parse(idController.text),
      name: nameController.text,
      age: int.parse(ageController.text),
    );
    utils.updateHuman(test);
    humanList = await utils.humans();
    getData();
  }

  _onPressedAdd() async {
    final test = Human(
      id: int.parse(idController.text),
      name: nameController.text,
      age: int.parse(ageController.text),
    );
    utils.insertHuman(test);
    humanList = await utils.humans();
    getData();
  }

  _deleteHumanTable() {
    utils.deleteTable();
    humanList = [];
    getData();
  }

  void getData() async {
    await utils.humans().then((result) => {
          setState(() {
            humanList = result;
          })
        });
    print(humanList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 256.0),
              MyTextField("ID", false, idController, Icons.add),
              MyTextField(
                  "İsim", false, nameController, Icons.people_alt_rounded),
              MyTextField(
                  "Yaş", false, ageController, Icons.card_giftcard_rounded),
              SizedBox(
                height: 25,
              ),

              MyButton(
                  text: "Ekle",
                  onCustomButtonPressed: () {
                    _onPressedAdd();
                  },
                  icon: Icon(Icons.add)),
              MyButton(
                  text: "Sil",
                  onCustomButtonPressed: () {
                    _deleteHumanTable();
                  },
                  icon: Icon(Icons.add)),
              MyButton(
                  text: "Güncelle",
                  onCustomButtonPressed: () {
                    _onPressedUpdate();
                  },
                  icon: Icon(Icons.add)),
              MyButton(
                  text: "Listele",
                  onCustomButtonPressed: () {
                    getData();
                  },
                  icon: Icon(Icons.add)),
              Text(humanList.length.toString()),
              SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: humanList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            color: Colors.white,
                            child: Center(child: Text(humanList[index].name)),
                          );

                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
