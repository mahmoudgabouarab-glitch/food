import 'package:equatable/equatable.dart';

class AddToCartModel extends Equatable {
  final int code;
  final String message;
  final dynamic data;

  const AddToCartModel({required this.code, required this.message, this.data});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
    code: json['code'] as int? ?? 0,
    message: json['message'] as String? ?? "",
    data: json['data'] as dynamic ?? "",
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data,
  };

  @override
  List<Object?> get props => [code, message, data];
}
