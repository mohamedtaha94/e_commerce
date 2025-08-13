import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/service_locator.dart';


class SignupUseCase implements UseCase<Either,UserCreationReq> {
  SignupUseCase( );



  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }

  
}