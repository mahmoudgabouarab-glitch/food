import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int code;
  final String message;
  final List<ListOfCategory> data;

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
            ?.map((e) => ListOfCategory.fromJson(e as Map<String, dynamic>))
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

class ListOfCategory extends Equatable {
  final int id;
  final String name;

  const ListOfCategory({required this.id, required this.name});

  factory ListOfCategory.fromJson(Map<String, dynamic> json) => ListOfCategory(
    id: json['id'] as int? ?? 1,
    name: json['name'] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
