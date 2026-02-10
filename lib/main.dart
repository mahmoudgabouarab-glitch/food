import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/bloc_observer.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper().init();
  setupServiceLocator();
  checkIsloggedinuser();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('en'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}
