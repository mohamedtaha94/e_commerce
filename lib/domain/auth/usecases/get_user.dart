import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/service_locator.dart';


class GetUserUseCase implements UseCase<Either,dynamic> {
  GetUserUseCase( );


  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getUser();
  }

}