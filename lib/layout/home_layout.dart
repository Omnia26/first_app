// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_is_empty

import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived_tasks%20copy/archived_task_screen.dart';
import 'package:firstapp/modules/done_tasks/done_task_screen.dart';
import 'package:firstapp/modules/new_tasks/new_task_screen.dart';
import 'package:firstapp/shared/components/components.dart';
import 'package:firstapp/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    newTaskScreen(),
    doneTaskScreen(),
    archivedTaskScreen(),
  ];
  List<String> titles = [
    'newTask',
    'doneTask',
    'archivedTask',
  ];
  int currentindex = 0;
  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  bool showed = false;
  IconData fibicon = Icons.edit;
  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          titles[currentindex],
        ),
      ),
      body: ConditionalBuilder(
        builder: (context) => screens[currentindex],
        condition: tasks.length > 0,
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
          /*onPressed: () async {
          var name = await getName();
          print(name);
        },*/
          onPressed: () {
            if (showed) {
              if (formkey.currentState?.validate() == true) {
                insertDatabase(
                  title: titlecontroller.text,
                  date: datecontroller.text,
                  time: timecontroller.text,
                ).then((value) {
                  getDataFromDataBase(database).then((value) {
                    Navigator.pop(context);
                    setState(() {
                      showed = false;
                      fibicon = Icons.edit;
                      tasks = value;
                      print(tasks);
                    });
                  });
                });
              }
            } else {
              scaffoldkey.currentState
                  ?.showBottomSheet(
                    (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(
                        20.0,
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(
                              controller: titlecontroller,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "title cannot be empty";
                                }
                                return null;
                              },
                              prefix: Icons.title,
                              label: 'title',
                              onTap: () {
                                print('tapped');
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: datecontroller,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "title cannot be empty";
                                }
                                return null;
                              },
                              prefix: Icons.date_range,
                              label: 'date',
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse("2024-10-04"),
                                ).then((value) {
                                  datecontroller.text = value.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: timecontroller,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "title cannot be empty";
                                }
                                return null;
                              },
                              prefix: Icons.timelapse,
                              label: 'time',
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timecontroller.text =
                                      value.toString(); //format(context)
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  )
                  .closed
                  .then((value) {
                //Navigator.pop(context);
                showed = false;
                setState(() {
                  fibicon = Icons.edit;
                });
              });
              showed = true;
              setState(() {
                fibicon = Icons.add;
              });
            }
            /*getName().then((value) {
              print(value);
              print('omnia');
              //throw ('error');
            }).catchError((error) {
              print('error is ${error.toString()}');
            });*/
          },
          child: Icon(
            fibicon,
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archived',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }

  Future<String> getName() async {
    var name = 'omnia ali';
    return name;
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db', //db  name
      version: 1,
      onCreate: (database, version) {
        print("database is created");
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((onError) {
          print('onError${onError.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database).then((value) {
          setState(() {
            tasks = value;
            print(tasks);
          });
        });
        print("database is opened");
      },
    );
  }

  Future insertDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    return await database.transaction((txn) async {
      //
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print("$value  inserted successfully");
      }).catchError((error) {
        print('onError${error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDataBase(Database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
