import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/data/models/profile_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_cropper/image_cropper.dart';

part 'updata_profile_state.dart';

class UpdataProfileCubit extends Cubit<UpdataProfileState> {
  UpdataProfileCubit(this._repo) : super(UpdataProfileInitial());
  final AuthRepo _repo;

  // updateProfile
  Future<void> updateProfileData({
    required String name,
    required String email,
    required String address,
    required String visa,
  }) async {
    emit(UpdataProfileLoading());

    final data = await _repo.postUpdataProfile(
      name: name,
      email: email,
      address: address,
      visa: visa.replaceAll(' ', ''),
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
