
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuantity({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin:  EdgeInsets.symmetric(horizontal: 16.r),
      padding:  EdgeInsets.only(left: 12.r),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            'Quantity',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){
                  context.read<ProductQuantityCubit>().decrement();
                },
                 icon: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary
                  ),
                  child:  Center(
                    child: Icon(
                      Icons.remove,
                      size: 30.r,
                    ),
                  ),
                 )
                ),
               SizedBox(width: 10.w,),
              BlocBuilder<ProductQuantityCubit,int>(
                builder: (context, state) => Text(
                  state.toString(),
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp
                  ),
                ),
              ),
               SizedBox(width: 10.w,),
              IconButton(
                onPressed: (){
                  context.read<ProductQuantityCubit>().increment();
                },
                 icon: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary
                  ),
                  child:  Center(
                    child: Icon(
                      Icons.add,
                      size: 30.r,
                    ),
                  ),
                 )
                ),

            ],
          )
        ],
      ),
    );
  }
}