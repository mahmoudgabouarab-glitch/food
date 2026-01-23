import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<AuthRepoImpl>())..getProfile(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(highlightColor: Colors.transparent),
          debugShowCheckedModeBanner: false,
          home: const Splash(),
        ),
      ),
    );
  }
}
