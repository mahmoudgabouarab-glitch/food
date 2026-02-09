import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_widget_err.dart';
import 'package:food/features/settings/data/repo/profile_repo_impl.dart';
import 'package:food/features/settings/presentation/view/widgets/profile/profile_body.dart';
import 'package:food/features/settings/presentation/view_model/updata_profile/updata_profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
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
