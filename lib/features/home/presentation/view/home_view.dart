import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/presentation/view/widgets/home_body.dart';
import 'package:food/features/home/presentation/view_model/cubit/category_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt<HomeRepoImpl>())..getCategory(),
      child: const HomeBody(),
    );
  }
}
