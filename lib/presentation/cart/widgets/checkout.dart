
import 'package:e_commerce/common/helper/cart/cart.dart';
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/presentation/cart/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/order/entities/product_ordered.dart';

class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const Checkout({
    required this.products,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(16.r),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Subtotal',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products).toString()}',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
                ),
              )
            ],
          ),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp
                ),
              ),
              Text(
                '\$8',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
                ),
              )
            ],
          ),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp
                ),
              ),
              Text(
                '\$0.0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Total',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products) + 8 }',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
                ),
              )
            ],
          ),
          BasicAppButton(
            onPressed: (){
              AppNavigator.push(context, CheckOutPage(products: products,));
            },
            title: 'Checkout',
          )
        ],
      ),
    );
  }
}