//import 'dart:io';

//import 'package:flutter/material.dart';

/*void main() {
  num x = 10, y = 3;
  String? operator='';
  debugPrint(
      "Enter an operator to your operation: + , - , * , / , % , ~/ , ++ , -- ");
  operator = stdin.readLineSync();
  switch (operator) {
    case '+':
      debugPrint((x + y).toString());
      break;
    case '-':
      debugPrint((x - y).toString());
      break;
    case '*':
      debugPrint((x * y).toString());
      break;
    case '/':
      debugPrint((x / y).toString());
      break;
    case '%':
      debugPrint((x % y).toString());
      break;
    case '~/':
      debugPrint((x ~/ y).toString());
      break;
    default:
      debugPrint('non true');
  }
}*/
void main() {
  Human person1 = Human(
      weight: 55,
      hight: 120,
      haircolor: "black",
      name: "omnia",
      age: 20,
      address: "bns");
  //person1.setNumberOfArms(2);
  //person1.getNumberOfArms();
  person1._numberofarms = 1;
  //print(person1._numberofarms);
  //print(person1.name);
  Person p1 = Person(
    havecar: true,
  );
  //print(p1.havecar);
  //p1.work();
  child c = child();
  //c.work();
  print(c.havecar);
  Human.numofobject();
}

class Human {
  int? _numberofarms;
  double? weight;
  double? hight;
  String? haircolor;
  String? name;
  int? age;
  String? address;
  static int? numofobj = 0;
  /*Human(
      {double? weight,
      double? hight,
      String? haircolor,
      String? name,
      int? age,
      String? address}) {
    this.weight = weight;
    this.hight = hight;
    this.haircolor = haircolor;
    this.name = name;
    this.address = address;
    this.age = age;
  }*/

  Human({
    this.weight,
    this.hight,
    this.haircolor,
    this.name,
    this.age,
    this.address,
  });

  /*void setNumberOfArms(int numberofarms) {
    this._numberofarms = numberofarms;
  }

  int getNumberOfArms() {
    return this._numberofarms!;
  }*/
  set numberofarms(int numberofarms) {
    this._numberofarms = numberofarms;
  }

  int get numberofarms {
    return this._numberofarms!;
  }

  void work() {
    print('working');
  }

  static void numofobject() {
    print('number of object=$numofobj');
  }
}

class Person extends Human {
  bool? havecar;
  void driver() {
    print('can drive a car');
  }

  Person({
    this.havecar,
  });
  @override
  void work() {
    print('driving');
  }
}

class child extends Person {
  int? birthmonth;
  child({this.birthmonth}) : super(havecar: true);
}
