import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/settings/data/model/profile_model.dart';
import 'package:food/features/settings/data/repo/profile_repo.dart';
import 'package:image_cropper/image_cropper.dart';

part 'updata_profile_state.dart';

class UpdataProfileCubit extends Cubit<UpdataProfileState> {
  UpdataProfileCubit(this._repo) : super(UpdataProfileInitial());
  final ProfileRepo _repo;

  // updateProfile
  Future<void> updateProfileData({
    required String name,
    required String email,
    required String address,
  }) async {
    emit(UpdataProfileLoading());

    final data = await _repo.postUpdataProfile(
      name: name,
      email: email,
      address: address,
    );

    data.fold(
      (failure) => emit(UpdataProfileFailure(failure.errormessage)),
      (success) => emit(UpdataProfileSuccess(success)),
    );
  }

  // updateAvatar
  Future<void> updateAvatar(CroppedFile? image) async {
    emit(UpdataProfileLoading());

    final data = await _repo.postUpdataProfile(image: image);

    data.fold(
      (failure) => emit(UpdataProfileFailure(failure.errormessage)),
      (success) => emit(UpdataProfileSuccess(success)),
    );
  }
}
