import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';

class GetProductsByCategoryIdUseCase implements UseCase<Either,String> {
  GetProductsByCategoryIdUseCase( );


  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByCategoryId(params!);
  }

}