import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final dynamic code;
  final String message;
  final UserData data;

  const AuthModel({
    required this.code,
    required this.message,
    required this.data,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      code: json["code"] as dynamic,
      message: json["message"] as String? ?? "",
      data: UserData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
    );
  }

  @override
  List<Object?> get props => [code, message, data];
}

class UserData extends Equatable {
  final String token;
  final String name;
  final String email;
  final String image;
  final String? visa;
  final String address;

  const UserData({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
    required this.visa,
    required this.address,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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
