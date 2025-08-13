
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/core/configs/assets/app_images.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.orderPlaced
              ) ,
            ),
             SizedBox(height: 60.h,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300.h,
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                decoration:  BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Order Placed Successfully',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                      ),
                    ),
                     SizedBox(height: 30.h,),
                    BasicAppButton(
                      title: 'Finish',
                      onPressed: (){
                        AppNavigator.pushAndRemove(context, const HomePage());
                      } 
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}