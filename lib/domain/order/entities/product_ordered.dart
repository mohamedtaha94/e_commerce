import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final Timestamp createdDate;
  final String id;

  ProductOrderedEntity({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
    required this.id,
  });
}

