import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/service_locator.dart';

class SigninUseCase implements UseCase<Either,UserSigninReq> {
  SigninUseCase( );


  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}