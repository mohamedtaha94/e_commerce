import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';


class AddOrRemoveFavoriteProductUseCase implements UseCase<Either,ProductEntity> {
  AddOrRemoveFavoriteProductUseCase();


  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }

}