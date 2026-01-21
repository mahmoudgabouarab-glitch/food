import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/bloc_observer.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/myapp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  setupServiceLocator();
  checkIsloggedinuser();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
