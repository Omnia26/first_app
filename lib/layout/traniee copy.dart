// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, argument_type_not_assignable_to_error_handler, avoid_print, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_is_empty, unused_import, use_key_in_widget_constructors, must_be_immutable
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firstapp/modules/archived_tasks%20copy/archived_task_screen.dart';
import 'package:firstapp/modules/done_tasks/done_task_screen.dart';
import 'package:firstapp/modules/new_tasks/new_task_screen.dart';
import 'package:firstapp/shared/components/components.dart';
import 'package:firstapp/shared/cubitt/cubitt.dart';
import 'package:firstapp/shared/cubitt/statuss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class Trainee extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..createDataBase(),
        child: BlocConsumer<AppCubit, States>(
          listener: (context, state) {
          if (state is AppInsertState) 
          {
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentindex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentindex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.varshow) {
                  if (formkey.currentState?.validate() == true) {
                    cubit.insertDatabase(
                      phonenum: phonecontroller.text,
                      name: namecontroller.text,
                      age: agecontroller.text,
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
                    cubit.changebottomsheetstatus(
                      varrshow2: false,
                      varricon2: Icons.edit,
                    );
                  });
                  cubit.changebottomsheetstatus(
                    varrshow2: true,
                    varricon2: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.varicon,
              ),
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
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archive',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        }));
  }
}
