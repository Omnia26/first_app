// ignore_for_file: prefer_const_constructors, must_be_immutable, duplicate_import

import 'package:firstapp/models/user.dart';
import 'package:firstapp/models/user.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);
  List<Users> list = [
    Users(
      name: "omnia",
      message: "hello it is the first message to me",
      time: "5:00am",
    ),
    Users(
      name: "sara",
      message: "hello it is the first message to me",
      time: "1:12pm",
    ),
    Users(
      name: "aya",
      message: "hello it is the first message to me",
      time: "1:12am",
    ),
    Users(
      name: "abdo",
      message: "hello it is the first message to me",
      time: "12:12pm",
    ),
    Users(
      name: "walaa",
      message: "hello it is the first message to me",
      time: "5:00am",
    ),
    Users(
      name: "sara",
      message: "hello it is the first message to me",
      time: "1:12pm",
    ),
    Users(
      name: "hodoo",
      message: "hello it is the first message to me",
      time: "1:12am",
    ),
    Users(
      name: "asmaa",
      message: "hello it is the first message to me",
      time: "12:12pm",
    ),
    Users(
      name: "hager",
      message: "hello it is the first message to me",
      time: "5:00am",
    ),
    Users(
      name: "mai",
      message: "hello it is the first message to me",
      time: "1:12pm",
    ),
    Users(
      name: "ali",
      message: "hello it is the first message to me",
      time: "5:00am",
    ),
    Users(
      name: "salwa",
      message: "hello it is the first message to me",
      time: "1:12pm",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-Be8wsfsPrg6Ftijm32gIkMHLE8VYFHKAeQ&usqp=CAU"),),
          title: Text(list[index].name),
          subtitle: Text(list[index].message),
          trailing: Text(list[index].time),

        );
      },
    );
  }
}
