import 'package:equatable/equatable.dart';

class ListOfOrderHistory extends Equatable {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String productImage;

  const ListOfOrderHistory({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.productImage,
  });

  factory ListOfOrderHistory.fromJson(Map<String, dynamic> json) =>
      ListOfOrderHistory(
        id: json['id'] as int? ?? 0,
        status: json['status'] as String? ?? '',
        totalPrice: json['total_price'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        productImage: json['product_image'] as String? ?? '',
      );

  @override
  List<Object?> get props {
    return [id, status, totalPrice, createdAt, productImage];
  }
}
