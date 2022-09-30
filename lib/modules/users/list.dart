// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:firstapp/models/user/user_model';
// 1. build item
// 2. build list
// 3. add item to list



// ignore: camel_case_types
class dBase extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      phone: '+201115342559',
    ),
    UserModel(
      id: 2,
      name: 'Osama Mansour',
      phone: '+201117842559',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed Ali',
      phone: '+2087856136',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contacts',
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildContactItem(users[index]),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
        ));
  }
}

Widget buildContactItem(UserModel user) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            child: Text(
              '${user.id}',
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              Text(
                '${user.phone}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
