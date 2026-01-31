import 'package:equatable/equatable.dart';
import 'package:food/features/order_history/data/model/order/datum.history.model.dart';

class OrderHistoryModel extends Equatable {
  final int? code;
  final String? message;
  final List<ListOfOrderHistory>? data;

  const OrderHistoryModel({this.code, this.message, this.data});

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
    code: json['code'] as int? ?? 0,
    message: json['message'] as String? ?? '',
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ListOfOrderHistory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  @override
  List<Object?> get props => [code, message, data];
}
