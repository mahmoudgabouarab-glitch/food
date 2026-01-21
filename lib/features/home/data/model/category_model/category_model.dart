import 'package:equatable/equatable.dart';

import 'datum.dart';

class CategoryModel extends Equatable {
  final int code;
  final String message;
  final List<Datum> data;

  const CategoryModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    code: json['code'] as int? ?? 0,
    message: json['message'] as String? ?? "",
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [code, message, data];
}
