// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unused_element, must_be_immutable, unused_local_variable

import 'package:firstapp/modules/counter/cubit/cubit.dart';
import 'package:firstapp/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Adrbk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'counter',
                  ),
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).minus();
                        },
                        child: Text(
                          'minus',
                        ),
                      ),
                      Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        child: Text(
                          'plus',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
