class User {
  String name, email, pass,gender,happy,health,info;
  double number;
  int age;
  User(){}
  User.info(String name,String email,double number,int age, String gender,String happy,String health, String info){
    this.name = name;
    this.email = email;
    this.number = number;
    this.gender = gender;
    this.happy = happy;
    this.health = health;
    this.info = info;
    this.age = age;
  }

}