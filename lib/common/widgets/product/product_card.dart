
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/presentation/product_detail/pages/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../helper/images/image_display.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    required this.productEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, ProductDetailPage(productEntity: productEntity,));
      },
      child: Container(
        width: 180.w,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[0]
                      )
                    )
                  ),
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r)
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.all(8.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.title,
                        style:  TextStyle(
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            productEntity.discountedPrice == 0 ? "${productEntity.price}\$" :
                            "${productEntity.discountedPrice}\$",
                            style:  TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                           SizedBox(width: 10.w, ),
                            Text(
                              productEntity.discountedPrice == 0 ? '' :
                              "${productEntity.price}\$",
                              style:  TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}