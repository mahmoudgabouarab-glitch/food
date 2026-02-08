import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/profile/presentation/view/widgets/profile/profile_actions.dart';
import 'package:food/features/profile/presentation/view/widgets/profile/profile_avatar.dart';
import 'package:food/features/profile/presentation/view/widgets/profile/profile_form.dart';
import 'package:food/features/profile/presentation/view/widgets/profile/profile_listener.dart';
import 'package:food/features/profile/presentation/view/widgets/profile/updata_avatar.dart';
import 'package:food/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile.tr()),
        centerTitle: false,
      ), 
      body: RefreshIndicator(
        color: AppColor.btn,
        displacement: 60,
        onRefresh: () async {
          await context.read<ProfileCubit>().getProfile();
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                ProfileAvatar(),
                UpdataAvatar(),
                ProfileForm(),
                ProfileActions(),
                ProfileListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
