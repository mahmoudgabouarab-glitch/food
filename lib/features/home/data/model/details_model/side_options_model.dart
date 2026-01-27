 import 'package:equatable/equatable.dart';

class SideOptionsModel extends Equatable {
  final int code;
  final String message;
  final List<ListOfSideOptions> data;

  const SideOptionsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SideOptionsModel.fromJson(Map<String, dynamic> json) {
    return SideOptionsModel(
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: List<ListOfSideOptions>.from(
        json['data'].map((e) => ListOfSideOptions.fromJson(e)),
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

class ListOfSideOptions extends Equatable {
  final int id;
  final String name;
  final String image;

  const ListOfSideOptions({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ListOfSideOptions.fromJson(Map<String, dynamic> json) {
    return ListOfSideOptions(
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
