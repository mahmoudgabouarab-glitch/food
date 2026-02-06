import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_widget_err.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/profile/data/repo/profile_repo_impl.dart';
import 'package:food/features/profile/presentation/view/widgets/profile_body.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';
import 'package:food/features/profile/presentation/view_model/updata_profile/updata_profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogoutCubit(getIt<AuthRepoImpl>())),
        BlocProvider(
          create: (context) => UpdataProfileCubit(getIt<ProfileRepoImpl>()),
        ),
      ],
      child: isGuest
          ? CustomWidgetErr()
          : const ProfileBody(),
    );
  }
}
