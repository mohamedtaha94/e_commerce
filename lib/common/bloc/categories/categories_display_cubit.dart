import 'package:e_commerce/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce/domain/category/usecases/get_categories.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {

  CategoriesDisplayCubit() : super (CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadCategoriesFailure()
        );
      }, 
      (data) {
        emit(
          CategoriesLoaded(categories: data)
        );
      }
    );
  }

}