// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'color.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
      print('🧪 Fetched colors from Firestore: ${map['colors']}');

    return ProductModel(
      categoryId: map['categoryId'] ?? '',
      colors: (map['colors'] as List?)?.map((e) {
            if (e is Map<String, dynamic>) {
              return ProductColorModel.fromMap(e);
            } else {
              return ProductColorModel(title: 'Unknown', rgb: [0, 0, 0]);
            }
          }).toList() ??
          [],
      createdDate: map['createdDate'] ?? Timestamp.now(),
      discountedPrice: map['discountedPrice'] ?? 0,
      gender: map['gender'] ?? 0,
      images: (map['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      price: map['price'] ?? 0,
      sizes: (map['sizes'] as List?)?.map((e) => e.toString()).toList() ?? [],
      productId: map['productId'] ?? '',
      salesNumber: map['salesNumber'] ?? 0,
      title: map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images,
      'price': price,
      'sizes': sizes,
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => ProductColorModel.fromEntity(e)).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
