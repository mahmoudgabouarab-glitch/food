import 'package:equatable/equatable.dart';

class FavProductsResponse extends Equatable {
  final int code;
  final String message;
  final List<FavoriteProduct> data;

  const FavProductsResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory FavProductsResponse.fromJson(Map<String, dynamic> json) {
    return FavProductsResponse(
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => FavoriteProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [code, message, data];
}

class FavoriteProduct extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rating;
  final String price;
  final bool isFavorite;

  const FavoriteProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.isFavorite,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? "",
      price: json['price'] as String? ?? "",
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    image,
    rating,
    price,
    isFavorite,
  ];
}
