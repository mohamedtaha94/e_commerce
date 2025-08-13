// ignore_for_file: prefer_iterable_wheretype

import 'package:e_commerce/data/order/models/order_status.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/domain/order/entities/order.dart';

class OrderModel {
  final String id;
  final String code;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final List<ProductOrderedModel> products;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.id,
    required this.code,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.products,
    required this.orderStatus,
  });
  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
  final rawProducts = map['products'] as List?;
  final rawStatuses = map['orderStatus'] as List?;

  return OrderModel(
    id: id,
    code: map['code'] ?? '',
    createdDate: map['createdDate'] ?? '',
    shippingAddress: map['shippingAddress'] ?? '',
    itemCount: map['itemCount'] ?? 0,
    totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
    products: (rawProducts ?? [])
        .where((e) => e is Map<String, dynamic>)
        .map((e) => ProductOrderedModel.fromMap(e as Map<String, dynamic>))
        .toList(),
    orderStatus: (rawStatuses ?? [])
        .where((e) => e is Map<String, dynamic>)
        .map((e) => OrderStatusModel.fromMap(e as Map<String, dynamic>))
        .toList(),
  );
}


  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      code: code,
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      products: products.map((e) => e.toEntity()).toList(),
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
