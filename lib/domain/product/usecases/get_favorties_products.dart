import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';

class GetFavortiesProductsUseCase implements UseCase<Either,dynamic> {
  GetFavortiesProductsUseCase();


  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getFavoritesProducts();
  }

}