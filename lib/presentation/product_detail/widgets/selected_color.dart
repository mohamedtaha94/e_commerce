
import 'package:e_commerce/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;

  const SelectedColor({
    required this.productEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorSelectionCubit>(context),
            child: ProductColors(productEntity: productEntity),
          ),
        );

      },
      child: Container(
        height: 60.h,
        margin:  EdgeInsets.symmetric(horizontal: 16.r),
        padding:  EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Color',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    if (productEntity.colors.isEmpty || state >= productEntity.colors.length) {
                      return const Text(
                        "N/A",
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    final rgb = productEntity.colors[state].rgb;
                    return Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          rgb[0],
                          rgb[1],
                          rgb[2],
                          1,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                 SizedBox(width: 15.w),
                 Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
