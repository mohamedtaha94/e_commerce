
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/presentation/settings/pages/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/navigator/app_navigator.dart';

class MyOrdersTile extends StatelessWidget {
  const MyOrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, const MyOrdersPage());
      },
      child: Container(
        height: 70.h,
        padding:  EdgeInsets.symmetric(horizontal: 16.r),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Orders',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded
            )
          ],
        ),
      ),
    );
  }
}