

import 'package:e_commerce/domain/order/entities/order_status.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String id;
  final String code;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final List<ProductOrderedEntity> products;
  final List<OrderStatusEntity> orderStatus; // ← Needed for UI

  const OrderEntity({
    required this.id,
    required this.code,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.products,
    required this.orderStatus,
  });

  @override
  List<Object?> get props => [
    id, code, createdDate, shippingAddress, itemCount, totalPrice, products, orderStatus
  ];
}
