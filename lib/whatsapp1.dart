// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firstapp/chat.dart';
import 'package:flutter/material.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsAPP",),
          actions: [
            Icon(
              Icons.search,
            ),
            Icon(
              Icons.list,
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Icon(Icons.camera,),
              Text("CHATS",),
              Text("STATUS",),
              Text("CALLS",),
            ]
            ),
        ),
        body: TabBarView(
          children: [
            Container(),
            Chat(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
