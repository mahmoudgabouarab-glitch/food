import 'package:equatable/equatable.dart';

class OrderResponse extends Equatable {
  final int code;
  final String message;
  final OrderData data;

  const OrderResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      code: json['code'] as int,
      message: json['message'] as String? ?? '',
      data: OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [code, message, data];
}

class OrderData extends Equatable {
  final int orderId;

  const OrderData({
    required this.orderId,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orderId: json['order_id'] as int,
    );
  }

  @override
  List<Object?> get props => [orderId];
}
