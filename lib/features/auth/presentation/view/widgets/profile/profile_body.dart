import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_bloc_listener.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_actions.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_app_bar.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_avatar.dart';
import 'package:food/features/auth/presentation/view/widgets/profile/profile_form.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: RefreshIndicator(
        color: AppColor.btn,
        displacement: 60,
        onRefresh: () async {
          await context.read<ProfileCubit>().getProfile();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: const [
                ProfileAvatar(),
                ProfileForm(),
                ProfileActions(),
                ProfileBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
