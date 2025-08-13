

import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic> {
  IsLoggedInUseCase( );


  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}