
import 'package:e_commerce/common/helper/images/image_display.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/theme/app_colors.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const ProductOrderedCard({
    required this.productOrderedEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding:  EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            ImageDisplayHelper.generateProductImageURL(
                              productOrderedEntity.productImage
                            )
                          )
                        ),
                        borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                  ),
                   SizedBox(width: 10.w, ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productOrderedEntity.productTitle,
                            overflow: TextOverflow.ellipsis,
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp
                            ),
                          ),
                          Row(
                            children: [
                              Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  text: 'Size - ',
                                  style:  TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productSize,
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp
                                      ),
                                    )
                                  ]
                                )
                              ),
                               SizedBox(width: 10.w, ),
                              Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  text: 'Color - ',
                                  style:  TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productColor,
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp
                                      ),
                                    )
                                  ]
                                )
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '\$${productOrderedEntity.totalPrice}',
                      style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp
                      ),
                    ),
                     GestureDetector(
                       onTap: () {
                        context.read<CartProductsDisplayCubit>().removeProduct(productOrderedEntity);
                       },
                       child: Container(
                         height: 23.h,
                         width: 23.w,
                         decoration: const BoxDecoration(
                             color: Color(0xffFF8383),
                             shape: BoxShape.circle
                           ),
                           child:  Icon(
                             Icons.remove,
                             size: 15.r,
                           ),
                       ),
                     )
                ],
              ),
            )
          ],
        ),
    );
  }
}