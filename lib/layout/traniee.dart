// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, argument_type_not_assignable_to_error_handler, avoid_print, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_is_empty
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived_tasks%20copy/archived_task_screen.dart';
import 'package:firstapp/modules/done_tasks/done_task_screen.dart';
import 'package:firstapp/modules/new_tasks/new_task_screen.dart';
import 'package:firstapp/shared/components/components.dart';
import 'package:firstapp/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Trainee extends StatefulWidget {
  const Trainee({Key? key}) : super(key: key);

  @override
  State<Trainee> createState() => _TraineeState();
}

class _TraineeState extends State<Trainee> {
  late Database database;
  int currentindex = 0;
  IconData varicon = Icons.edit;
  bool varshow = false;
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
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var agecontroller = TextEditingController() ;
  @override
  void initState() {
    super.initState();
    createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(titles[currentindex]),
      ),
      body: ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context) => screens[currentindex],
        fallback: (context) => Center(child: CircularProgressIndicator()),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (varshow) {
            if (formkey.currentState?.validate() == true) {
              insertDatabase(
                phonenum: phonecontroller.text,
                name: namecontroller.text,
                age: agecontroller.text,
                ).then((value) {
                  getDataFromDataBase(database).then((value) {
                    Navigator.pop(context);
                    setState(() {
                      varshow = false;
                      varicon = Icons.edit;
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
                            controller: phonecontroller,
                            type: TextInputType.phone,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            prefix: Icons.phone,
                            label: 'phone number',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controller: namecontroller,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            prefix: Icons.perm_identity,
                            label: 'Name',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controller: agecontroller,
                            type: TextInputType.number,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'cannot be empty';
                              }
                              return null;
                            },
                            prefix: Icons.watch,
                            label: 'Age',
                          )
                        ],
                      ),
                    ),
                  ),
                  elevation: 20.0,
                )
                .closed
                .then((value) {
              varshow = false;
              setState(() {
                varicon = Icons.edit;
              });
            });
            varshow = true;
              setState(() {
                varicon = Icons.add;
              });
          }
        },
        child: Icon(varicon,),
      ),
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
            label: 'Done Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archive Tasks',
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

  void createDataBase() async {
    database = await openDatabase(
      'new.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE tasks(phonenum INTEGER PRIMARY KEY ,name TEXT,age INTEGER)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database).then((value) {
          setState(() {
            tasks = value;
            print(tasks);
          });
        });
        print('opened');
      },
    );
  }
  Future insertDatabase({
    required String phonenum,
    required String name,
    required String age,
  }) async {
    return await database.transaction((txn) async { 
      txn
          .rawInsert(
              'INSERT INTO tasks(phonenum,age,name) VALUES("$phonenum","$age","$name")')
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
  }}
