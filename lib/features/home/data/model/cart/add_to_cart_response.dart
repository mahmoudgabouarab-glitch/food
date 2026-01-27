import 'package:equatable/equatable.dart';

class AddToCartResponse extends Equatable {
  final int code;
  final String message;

  const AddToCartResponse({required this.code, required this.message});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
    );
  }

  @override
  List<Object?> get props => [code, message];
}
