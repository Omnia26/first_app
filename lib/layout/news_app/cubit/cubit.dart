// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firstapp/layout/news_app/cubit/state.dart';
import 'package:firstapp/modules/business/business.dart';
import 'package:firstapp/modules/science/science.dart';
import 'package:firstapp/modules/setttings/settings.dart';
import 'package:firstapp/modules/sports/sports.dart';
import 'package:firstapp/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
    Settings(),
  ];
  List<dynamic> business = [];
  void getBusiness() {
      emit(NewsbusinessloadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsgetbusinesssuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsgetbusinesserrorState(onError.toString()));
    });
    
  }

  List<dynamic> sports = [];
  void getsports() {
    if(sports.length==0)
    {
      emit(NewssportsloadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      sports = value?.data['articles'];
      print(sports[0]['title']);
      emit(NewsgetsportssuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsgetsportserrorState(onError.toString()));
    });
    }
    else
    {
     emit(NewsgetsportssuccessState());

    }
    
  }

  List<dynamic> science = [];
  void getscience() {
    if(science.length==0)
    {
      emit(NewsscienceloadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      science = value?.data['articles'];
      print(science[0]['title']);
      emit(NewsgetsciencesuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsgetscienceerrorState(onError.toString()));
    });
    }
    else
    {
      emit(NewsgetsciencesuccessState());
    }
    
  }

  void changeIndex(int index) {
    currentindex = index;
    if (index == 1) getsports();
    if (index == 2) getscience();
    emit(NewsChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'settings',
    ),
  ];
}
