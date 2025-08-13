// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/data/order/models/order.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/data/order/source/order_firebase_service.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OrderRepositoryImpl extends OrderRepository {


  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    
    return sl<OrderFirebaseService>().addToCart(addToCartReq);
  }
  
  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (data){
        return Right(
          List.from(data).map((e) => ProductOrderedModel.fromMap(e).toEntity()).toList()
        );
      }
    );
  }
  
  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (message){
        return Right(
          message
        );
      }
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnedData = await sl<OrderFirebaseService>().orderRegistration(order);
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (message){
        return Right(
          message
        );
      }
    );
  }
  

@override
Future<Either> getOrders() async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return Left(ServerFailure(message: 'User not logged in'));

    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Orders')
        .get();

    final orders = snapshot.docs.map((doc) {
      return OrderModel.fromMap(doc.data(), doc.id).toEntity();
    }).toList();

    return Right(orders);
  } catch (e, stackTrace) {
    print('❌ Error fetching orders: $e');
    print(stackTrace);
    
    return Left(ServerFailure(message: 'Something went wrong'));
    
  }
}
}

