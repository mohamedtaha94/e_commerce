import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/domain/order/entities/order_status.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] ?? '',
      done: map['done'] ?? false,
      createdDate: map['createdDate'] is Timestamp
          ? map['createdDate']
          : Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'done': done,
      'createdDate': createdDate,
    };
  }

  /// This is the fix: adds `toEntity()` to convert the model to entity
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      title: title,
      done: done,
      createdDate: createdDate,
    );
  }
}
