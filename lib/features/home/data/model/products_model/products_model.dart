import 'package:equatable/equatable.dart';

class ProductsModel extends Equatable {
  final int? code;
  final String message;
  final List<ListOfProducts> data;

  const ProductsModel({this.code, required this.message, required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    code: json['code'] as int?,
    message: json['message'] as String? ?? "",
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => ListOfProducts.fromJson(e as Map<String, dynamic>))
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

class ListOfProducts extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rating;
  final String price;

  const ListOfProducts({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory ListOfProducts.fromJson(Map<String, dynamic> json) => ListOfProducts(
    id: json['id'] as int? ?? 1,
    name: json['name'] as String? ?? "",
    description: json['description'] as String? ?? "",
    image: json['image'] as String? ?? "",
    rating: json['rating'] as String? ?? "",
    price: json['price'] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image,
    'rating': rating,
    'price': price,
  };

  @override
  List<Object?> get props {
    return [id, name, description, image, rating, price];
  }
}
