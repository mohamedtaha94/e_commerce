// ignore_for_file: public_member_api_docs, sort_constructors_first
/*

import 'package:e_commerce/domain/product/entities/color.dart';

class ProductColorModel {

  final String title;
  final List<int> rgb;

  ProductColorModel({
    required this.title,
    required this.rgb,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rgb': rgb,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      rgb: List < int > .from(
        map['rgb'].map((e) => e),
      ),
    );
  }

}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      title: title,
      rgb: rgb
    );
  }
}*/
import 'package:e_commerce/domain/product/entities/color.dart';

class ProductColorModel {
  final String title;
  final List<int> rgb;

  ProductColorModel({
    required this.title,
    required this.rgb,
  });

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] ?? '',
      rgb: (map['rgb'] as List?)?.map((e) => e as int).toList() ?? [0, 0, 0],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'rgb': rgb,
    };
  }

  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb,
    );
  }

  /// ✅ This is the missing static method you're trying to use
  static ProductColorModel fromEntity(ProductColorEntity entity) {
    return ProductColorModel(
      title: entity.title,
      rgb: entity.rgb,
    );
  }
}
