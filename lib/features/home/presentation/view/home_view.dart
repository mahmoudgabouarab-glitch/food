import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/presentation/view/widgets/home_body.dart';
import 'package:food/features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:food/features/home/presentation/view_model/products_cubit/products_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoryCubit(getIt<HomeRepoImpl>())..getCategory(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsCubit(getIt<HomeRepoImpl>())..getProducts(),
        ),
      ],
      child: const HomeBody(),
    );
  }
}
