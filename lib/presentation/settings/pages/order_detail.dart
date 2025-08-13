
  import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
  import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
  import 'package:e_commerce/domain/order/entities/order.dart';
  import 'package:e_commerce/presentation/settings/pages/order_items.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  import '../../../core/configs/theme/app_colors.dart';

  class OrderDetailPage extends StatelessWidget {
    final OrderEntity orderEntity;
    const OrderDetailPage({
      required this.orderEntity,
      super.key
      });

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: BasicAppbar(
          title: Text(
            'Order #${orderEntity.code}'
          ),
        ),
        body: SingleChildScrollView(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _status(),
               SizedBox(height: 50.h,),
              _items(context),
               SizedBox(height: 30.h,),
              _shipping()
            ],
          ),
        )
      );
    }

    Widget _status() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: orderEntity.orderStatus[index].done ? 
                      AppColors.primary :
                      Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: orderEntity.orderStatus[index].done ? const Icon(
                      Icons.check
                    )  : Container(),
                  ),
                   SizedBox(width: 15.w,),
                  Text(
                    orderEntity.orderStatus[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
                    ),
                  )
                ],
              ),
              Text(
                orderEntity.orderStatus[index].createdDate.toDate().toString().split(' ')[0],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) =>  SizedBox(height: 50.h,), 
        reverse: true,
        itemCount: orderEntity.orderStatus.length
      );
    }

    Widget _items(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              'Order Items',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
              ),
            ),
             SizedBox(height: 15.h, ),
            GestureDetector(
              onTap: (){
                AppNavigator.push(context, OrderItemsPage(products: orderEntity.products));
              },
                child: Container(
                  height: 70.h,
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.receipt_rounded
                            ),
                             SizedBox(width: 20.w, ),
                            Text(
                              '${orderEntity.products.length} Items',
                              style:  TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp
                              ),
                            )
                          ],
                        ),
                         Text(
                          'View All',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.primary
                          ),
                        )
                      ],
                    ),
                ),
              )
        ],
      );
    }

    Widget _shipping() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              'Shipping details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
              ),
            ),
             SizedBox(height: 15.h, ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Text(
                    orderEntity.shippingAddress
                  )
              )
        ],
      );
    }
  }