import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());
  final TextEditingController namecontrollar = .new();
  final TextEditingController emailcontrollar = .new();
  final TextEditingController addresscontrollar = .new();
  final TextEditingController visacontrollar = .new();
  final AuthRepo _repo;
  Future<void> getProfile() async {
    emit(ProfileLoading());
    var data = await _repo.getProfile();
    data.fold(
      (failure) {
        emit(ProfileFailure(failure.errormessage));
      },
      (success) {
        namecontrollar.text = success.data.name;
        emailcontrollar.text = success.data.email;
        addresscontrollar.text = success.data.address;
        visacontrollar.text = success.data.visa ?? "";
        emit(ProfileSuccess(success));
      },
    );
  }
}
