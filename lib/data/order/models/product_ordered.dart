import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/order/entities/product_ordered.dart';
/*
class ProductOrderedModel {
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

  ProductOrderedModel({
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

  /// ✅ Convert from entity to model
  factory ProductOrderedModel.fromEntity(ProductOrderedEntity entity) {
    return ProductOrderedModel(
      productId: entity.productId,
      productTitle: entity.productTitle,
      productQuantity: entity.productQuantity,
      productColor: entity.productColor,
      productSize: entity.productSize,
      productPrice: entity.productPrice,
      totalPrice: entity.totalPrice,
      productImage: entity.productImage,
      createdDate: entity.createdDate,
      id: entity.id,
    );
  }

  /// ✅ Convert from Firestore Map to Model
factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
  print("DEBUG Order Map: ${map['createdDate']} (${map['createdDate'].runtimeType})");
print("🧾 Raw products: ${map['products']} (${map['products'].runtimeType})");

  return ProductOrderedModel(
    
    productId: map['productId'] as String? ?? '',
    productTitle: map['productTitle'] as String? ?? '',
    productQuantity: map['productQuantity'] as int? ?? 0,
    productColor: map['productColor'] as String? ?? '',
    productSize: map['productSize'] as String? ?? '',
    productPrice: (map['productPrice'] as num?)?.toDouble() ?? 0.0,
    totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
    productImage: map['productImage'] as String? ?? '',
    /*createdDate: map['createdDate'] is Timestamp
        ? map['createdDate']
        : Timestamp.fromDate(DateTime.tryParse(map['createdDate'] ?? '') ?? DateTime.now()),*/
    id: map['id'] as String? ?? '',
    createdDate: map['createdDate'] is Timestamp
    ? map['createdDate']
    : Timestamp.fromDate(
        DateTime.tryParse(map['createdDate'] ?? '') ?? DateTime.now(),
      ),

    
  );
  
}



  /// ✅ Convert model to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
      'id': id,
    };
  }

  /// ✅ Convert to Entity
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productColor: productColor,
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
      id: id,
    );
  }
}*/

class ProductOrderedModel {
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

  ProductOrderedModel({
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

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {

    return ProductOrderedModel(
      productId: map['productId'] ?? '',
      productTitle: map['productTitle'] ?? '',
      productQuantity: map['productQuantity'] ?? 0,
      productColor: map['productColor'] ?? '',
      productSize: map['productSize'] ?? '',
      productPrice: (map['productPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (map['totalPrice'] as num?)?.toDouble() ?? 0.0,
      productImage: map['productImage'] ?? '',
      createdDate: map['createdDate'] is Timestamp
          ? map['createdDate']
          : Timestamp.fromDate(
              DateTime.tryParse(map['createdDate'] ?? '') ?? DateTime.now(),
            ),
      id: map['id'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
      'id': id,
    };
  }

  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productColor: productColor,
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
      id: id,
    );
  }

  factory ProductOrderedModel.fromEntity(ProductOrderedEntity entity) {
    return ProductOrderedModel(
      productId: entity.productId,
      productTitle: entity.productTitle,
      productQuantity: entity.productQuantity,
      productColor: entity.productColor,
      productSize: entity.productSize,
      productPrice: entity.productPrice,
      totalPrice: entity.totalPrice,
      productImage: entity.productImage,
      createdDate: entity.createdDate,
      id: entity.id,
    );
  }
}

