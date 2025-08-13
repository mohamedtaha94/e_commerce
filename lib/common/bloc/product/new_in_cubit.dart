// lib/common/bloc/product/new_in_cubit.dart

import 'package:e_commerce/common/bloc/product/products_display_cubit.dart';
import 'package:e_commerce/domain/product/usecases/get_new_in.dart';
import 'package:e_commerce/service_locator.dart';

class NewInCubit extends ProductsDisplayCubit {
  NewInCubit() : super(useCase: sl<GetNewInUseCase>());
}
