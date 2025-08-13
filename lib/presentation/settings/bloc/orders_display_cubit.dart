// ignore_for_file: avoid_print

import 'package:e_commerce/domain/order/usecases/get_orders.dart';
import 'package:e_commerce/presentation/settings/bloc/orders_display_state.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading()) {
    print('[Cubit] OrdersDisplayCubit constructor called');
  }

  void displayOrders() async {
    var returnedData = await sl<GetOrdersUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadOrdersFailure(errorMessage: error));
      },
      (orders) {
        emit(OrdersLoaded(orders: orders));
      },
    );
  }
}
