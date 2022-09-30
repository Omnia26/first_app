// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firstapp/modules/whatsapp/chat_list.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ChatList(),
    );
  }
}
