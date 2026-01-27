import 'package:equatable/equatable.dart';

class GetCartResponse extends Equatable {
  final int code;
  final String message;
  final Data data;

  const GetCartResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

  @override
  List<Object?> get props => [code, message, data];
}

class Data extends Equatable {
  final int id;
  final double totalPrice;
  final List<CartItem> items;

  const Data({
    required this.id,
    required this.totalPrice,
    required this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      totalPrice: double.tryParse(json['total_price']?.toString() ?? '0') ?? 0,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => CartItem.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, totalPrice, items];
}

class CartItem extends Equatable {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;
  final List<OptionItem> toppings;
  final List<OptionItem> sideOptions;

  const CartItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0,
      spicy: double.tryParse(json['spicy']?.toString() ?? '0') ?? 0,
      toppings: (json['toppings'] as List<dynamic>? ?? [])
          .map((e) => OptionItem.fromJson(e))
          .toList(),
      sideOptions: (json['side_options'] as List<dynamic>? ?? [])
          .map((e) => OptionItem.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    itemId,
    productId,
    name,
    image,
    quantity,
    price,
    spicy,
    toppings,
    sideOptions,
  ];
}

class OptionItem extends Equatable {
  final int id;
  final String name;
  final String image;

  const OptionItem({required this.id, required this.name, required this.image});

  factory OptionItem.fromJson(Map<String, dynamic> json) {
    return OptionItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, image];
}
