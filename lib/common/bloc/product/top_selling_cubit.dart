// lib/common/bloc/product/top_selling_cubit.dart

import 'package:e_commerce/common/bloc/product/products_display_cubit.dart';
import 'package:e_commerce/domain/product/usecases/get_top_selling.dart';
import 'package:e_commerce/service_locator.dart';

class TopSellingCubit extends ProductsDisplayCubit {
  TopSellingCubit() : super(useCase: sl<GetTopSellingUseCase>());
}
