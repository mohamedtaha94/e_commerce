import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class OrderRegistrationUseCase implements UseCase<Either,OrderRegistrationReq> {
  OrderRegistrationUseCase( );

  @override
  Future<Either> call({OrderRegistrationReq ? params}) async {
    return sl<OrderRepository>().orderRegistration(params!);
  }

}