import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_body.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(getIt<AuthRepoImpl>()),
      child: const ProfileBody(),
    );
  }
}
