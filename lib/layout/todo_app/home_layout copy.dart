// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_is_empty, unused_import, must_be_immutable
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived_tasks%20copy/archived_task_screen.dart';
import 'package:firstapp/modules/done_tasks/done_task_screen.dart';
import 'package:firstapp/modules/new_tasks/new_task_screen.dart';
import 'package:firstapp/shared/components/components.dart';
import 'package:firstapp/shared/components/constants.dart';
import 'package:firstapp/shared/cubit/cubit.dart';
import 'package:firstapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentindex],
              ),
            ),
            body: ConditionalBuilder(
              builder: (context) => cubit.screens[cubit.currentindex],
              condition: state is! AppGetDatabaseLoadingState,
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.showed) {
                    if (formkey.currentState?.validate() == true) {
                      cubit.insertDatabase(
                        title: titlecontroller.text,
                        date: datecontroller.text,
                        time: timecontroller.text,
                      );
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
                      cubit.changeBottomSheetState(
                        isshow: false,
                        icon: Icons.edit,
                      );
                    });
                    cubit.changeBottomSheetState(
                      isshow: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(
                  cubit.fibicon,
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
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
