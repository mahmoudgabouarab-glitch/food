import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/data/models/profile_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'updata_profile_state.dart';

class UpdataProfileCubit extends Cubit<UpdataProfileState> {
  UpdataProfileCubit(this._repo) : super(UpdataProfileInitial());
  final TextEditingController namecontrollar = .new();
  final TextEditingController emailcontrollar = .new();
  final TextEditingController addresscontrollar = .new();
  final TextEditingController visacontrollar = .new();
  final AuthRepo _repo;
  // updateProfile
  Future<void> updateProfileData() async {
    emit(UpdataProfileLoading());

    final data = await _repo.postUpdataProfile(
      name: namecontrollar.text,
      email: emailcontrollar.text,
      address: addresscontrollar.text,
      visa: visacontrollar.text.replaceAll(' ', ''),
    );

    data.fold(
      (failure) => emit(UpdataProfileFailure(failure.errormessage)),
      (success) => emit(UpdataProfileSuccess(success)),
    );
  }

  // updateAvatar
  Future<void> updateAvatar(XFile? image) async {
    emit(UpdataProfileLoading());

    final data = await _repo.postUpdataProfile(image: image);

    data.fold(
      (failure) => emit(UpdataProfileFailure(failure.errormessage)),
      (success) => emit(UpdataProfileSuccess(success)),
    );
  }

  //clear
  @override
  Future<void> close() {
    namecontrollar.dispose();
    emailcontrollar.dispose();
    addresscontrollar.dispose();
    visacontrollar.dispose();
    return super.close();
  }
}
//  await getProfile();