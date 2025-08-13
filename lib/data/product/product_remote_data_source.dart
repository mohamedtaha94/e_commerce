import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/product/models/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
  }
}
