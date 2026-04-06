import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/settings/data/model/profile_model.dart';
import 'package:food/features/settings/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());
  final TextEditingController namecontrollar = .new();
  final TextEditingController emailcontrollar = .new();
  final TextEditingController addresscontrollar = .new();
  final ProfileRepo _repo;

  //get profile
  Future<void> getProfile() async {
    emit(ProfileLoading());
    var data = await _repo.getProfile();
    data.fold(
      (failure) {
        emit(
          ProfileFailure(failure.errormessage, statusCode: failure.statusCode),
        );
      },
      (success) {
        namecontrollar.text = success.data.name;
        emailcontrollar.text = success.data.email;
        addresscontrollar.text = success.data.address;
        emit(ProfileSuccess(success));
      },
    );
  }

  //clear
  @override
  Future<void> close() {
    namecontrollar.dispose();
    emailcontrollar.dispose();
    addresscontrollar.dispose();
    return super.close();
  }
}
