import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/bloc_observer.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/myapp.dart';

bool isloggedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  setupServiceLocator();
  checkIsloggedinuser();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

void checkIsloggedinuser() {
  String? userToken = CacheHelper.getDataString(key: CacheKeys.token);
  if (userToken != null && userToken.isNotEmpty) {
    isloggedInUser = true;
  } else {
    isloggedInUser = false;
  }
}
