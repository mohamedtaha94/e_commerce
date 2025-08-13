
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/my_favorites.dart';

class MyFavortiesTile extends StatelessWidget {
  const MyFavortiesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, const MyFavoritesPage());
      },
      child: Container(
        height: 70.h,
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Favorites',
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