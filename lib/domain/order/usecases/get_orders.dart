import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class GetOrdersUseCase implements UseCase<Either,dynamic> {
  GetOrdersUseCase( );


  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getOrders();
  }

}
