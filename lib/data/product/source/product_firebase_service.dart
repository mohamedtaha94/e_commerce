// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/product/entities/product.dart';
import '../models/product.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {

@override
Future<Either> getTopSelling() async {
  try {
    var returnedData = await FirebaseFirestore.instance
        .collection('Products')
        .orderBy('salesNumber', descending: true)
        .limit(10)
        .get();
    return Right(returnedData.docs.map((e) => e.data()).toList());
  } catch (e) {
    return const Left('Please try again');
  }
}

@override
Future<Either> getNewIn() async {
  try {
    final sevenDaysAgo = Timestamp.fromDate(
      DateTime.now().subtract(const Duration(days: 7)),
    );

    var returnedData = await FirebaseFirestore.instance
        .collection('Products')
        .where('createdDate', isGreaterThanOrEqualTo: sevenDaysAgo)
        .orderBy('createdDate', descending: true)
        .limit(10)
        .get();

        print('🧪 Fetched ${returnedData.docs.length} New In products');
for (var doc in returnedData.docs) {
  print('📦 Product: ${doc.data()}');
}

    return Right(returnedData.docs.map((e) => e.data()).toList());
  } catch (e) {
    return const Left('Please try again');
  }
}

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      final normalizedId = categoryId.toLowerCase();

      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: normalizedId)
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getProductsByTitle(String title) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('title', isGreaterThanOrEqualTo: title)
        .where('title', isLessThanOrEqualTo: title + '\uf8ff')
        .get();

    final data = snapshot.docs.map((doc) => doc.data()).toList();
    return Right(data);
  } catch (e) {
    return Left(ServerFailure(message: e.toString()));
  }
}


  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();
      return products.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoritesProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
