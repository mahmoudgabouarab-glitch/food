import 'package:equatable/equatable.dart';

class ToppingsModel extends Equatable {
  final int code;
  final String message;
  final List<ToppingsResponse> data;

  const ToppingsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ToppingsModel.fromJson(Map<String, dynamic> json) {
    return ToppingsModel(
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: List<ToppingsResponse>.from(
        json['data'].map((e) => ToppingsResponse.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [code, message, data];
}

class ToppingsResponse extends Equatable {
  final int id;
  final String name;
  final String image;

  const ToppingsResponse({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ToppingsResponse.fromJson(Map<String, dynamic> json) {
    return ToppingsResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }

  @override
  List<Object?> get props => [id, name, image];
}
