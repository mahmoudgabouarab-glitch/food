import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());
  final TextEditingController namecontrollar = .new();
  final TextEditingController emailcontrollar = .new();
  final TextEditingController addresscontrollar = .new();
  final TextEditingController visacontrollar = .new();
  XFile? selectedImage;
  final AuthRepo _repo;
  //get profile
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

  void pickImage(XFile? file) {
    selectedImage = file;
    emit(ImageSuccess(file!));
  }

  Future<void> postUpdataProfile() async {
    emit(ProfileLoading());
    var data = await _repo.postUpdataProfile(
      name: namecontrollar.text,
      email: emailcontrollar.text,
      address: addresscontrollar.text,
      visa: visacontrollar.text,
      image: selectedImage,
    );
    data.fold(
      (failure) {
        emit(ProfileFailure(failure.errormessage));
      },
      (success) {
        emit(ProfileSuccess(success));
      },
    );
  }
   
}
