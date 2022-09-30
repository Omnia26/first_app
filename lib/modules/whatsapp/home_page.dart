// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firstapp/modules/whatsapp/chat_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('WhatsApp'),
          centerTitle: false,
          actions: [
            Icon(Icons.search,),
            Icon(Icons.more_vert,),
          ],
          bottom:TabBar(
            labelStyle:TextStyle(
              fontWeight:FontWeight.bold,
            ),
            tabs:<Widget>[
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text:'CHATS',),
            Tab(text:'STATUS',),
            Tab(text:'CALLS',),
          ],
          ),
        ),
        body: TabBarView(children:<Widget>[
          Container(),
          ChatScreen(),
          Container(),
          Container(),
        ],),
      ),
    );
  }
}