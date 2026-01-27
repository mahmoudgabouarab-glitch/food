import 'package:equatable/equatable.dart';

class AddToCartRequest extends Equatable {
  final List<AddToCartItem> items;

  const AddToCartRequest({required this.items});

  Map<String, dynamic> toJson() => {
    "items": items.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [items];
}

class AddToCartItem extends Equatable {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  const AddToCartItem({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "spicy": spicy,
    "toppings": toppings,
    "side_options": sideOptions,
  };

  @override
  List<Object?> get props => [
    productId,
    quantity,
    spicy,
    toppings,
    sideOptions,
  ];
}
