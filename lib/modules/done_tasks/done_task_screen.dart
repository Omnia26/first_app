// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:firstapp/shared/components/components.dart';
import 'package:firstapp/shared/cubitt/cubitt.dart';
import 'package:firstapp/shared/cubitt/statuss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class doneTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).donetasks;
        return tasksBuilder(tasks: tasks,);
      },
    );
  }
}
