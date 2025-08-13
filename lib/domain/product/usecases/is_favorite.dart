import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';

class IsFavoriteUseCase implements UseCase<bool,String> {
  IsFavoriteUseCase( );


  @override
  Future<bool> call({String ? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }

}