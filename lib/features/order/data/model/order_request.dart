import 'package:equatable/equatable.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';

class OrderRequest extends Equatable {
  final List<OrderItem> items;

  const OrderRequest({required this.items});

  Map<String, dynamic> toJson() => {
    "items": items.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [items];
}

class OrderItem {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  OrderItem({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory OrderItem.fromCartItem(CartItem item) {
    return OrderItem(
      productId: item.productId,
      quantity: item.quantity,
      spicy: item.spicy,
      toppings: item.toppings.map((e) => e.id).toList(),
      sideOptions: item.sideOptions.map((e) => e.id).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "spicy": spicy,
    "toppings": toppings,
    "side_options": sideOptions,
  };
}
