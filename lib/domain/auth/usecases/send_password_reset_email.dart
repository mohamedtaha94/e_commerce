import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/service_locator.dart';


class SendPasswordResetEmailUseCase implements UseCase<Either,String> {
  SendPasswordResetEmailUseCase( );


  @override
  Future<Either> call({String ? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }

}