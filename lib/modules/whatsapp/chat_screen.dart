// ignore_for_file: prefer_const_constructors

import 'package:firstapp/modules/whatsapp/chat_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20,),
            topRight: Radius.circular(20,),
          ),
        ),
        child: ChatList(),
      ),
    );
  }
}