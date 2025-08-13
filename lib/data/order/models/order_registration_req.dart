
import 'package:e_commerce/data/order/models/product_ordered.dart';
import '../../../domain/order/entities/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReq({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products
          .map((e) => ProductOrderedModel.fromEntity(e).toMap())
          .toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
    };
  }
}

