// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';

class GetTopSellingUseCase implements UseCase<Either, dynamic> {
  GetTopSellingUseCase( );

  @override
  Future<Either> call({dynamic params}) async {
    print("GetTopSellingUseCase called with params: $params");
    final result = await sl<ProductRepository>().getTopSelling();
    print("Result from ProductRepository: $result");
    return result;
  }
}


