
import 'package:e_commerce/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce/common/helper/cart/cart.dart';
import 'package:e_commerce/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/domain/order/usecases/order_registration.dart';
import 'package:e_commerce/presentation/cart/pages/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/bloc/button/button_state.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../domain/order/entities/product_ordered.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
   CheckOutPage({
     required this.products,
     super.key
   });

  final TextEditingController _addressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Checkout'
        ),
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener < ButtonStateCubit, ButtonState > (
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context,const OrderPlacedPage());
            }
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating, );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding:  EdgeInsets.all(16.r),
              child: Builder(
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _addressField(context),
                      BasicReactiveButton(
                        content: Container(
                          padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${CartHelper.calculateCartSubtotal(products)}',
                                  style:  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp
                                  ),
                                ),
                                 Text(
                                  'Place Order',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp
                                  ),
                                )
                              ],
                            ),
                        ),
                        onPressed: () {
                          context.read < ButtonStateCubit > ().execute(
                            usecase: OrderRegistrationUseCase(),
                            params: OrderRegistrationReq(
                              products: products,
                              createdDate: DateTime.now().toString(),
                              itemCount: products.length,
                              totalPrice: CartHelper.calculateCartSubtotal(products),
                              shippingAddress: _addressCon.text
                            )
                          );
                        }
                      )
                    ],
                  );
                }
              ),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: 'Shipping Address'
      ),
    );
  }
}