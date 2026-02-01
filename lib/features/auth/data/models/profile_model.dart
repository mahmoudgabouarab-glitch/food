import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int code;
  final String message;
  final UserProfileData data;

  const ProfileModel({
    required this.code,
    required this.message,
    required this.data,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      code: json["code"] as int,
      message: json["message"] as String? ?? "",
      data: UserProfileData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
    );
  }

  @override
  List<Object?> get props => [code, message, data];
}

class UserProfileData extends Equatable {
  final String token;
  final String name;
  final String email;
  final String image;
  final String? visa;
  final String address;

  const UserProfileData({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
    required this.visa,
    required this.address,
  });
  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      token: json["token"] as String? ?? "",
      name: json["name"] as String? ?? "",
      email: json["email"] as String? ?? "",
      image: json["image"] as String? ?? "",
      visa: json['Visa'] as String? ?? "",
      address: json['address'] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
    'image': image,
    "Visa": visa,
    "address": address,
  };
  @override
  List<Object?> get props => [token, name, email, image, address, visa];
}
