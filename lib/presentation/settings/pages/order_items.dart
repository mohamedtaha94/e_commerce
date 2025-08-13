import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/order/entities/product_ordered.dart';
import '../widgets/product_ordered_card.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderItemsPage({
    required this.products,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Order Items'
        ),
      ),
      body: _products()
    );
  }

  Widget _products() {
    return ListView.separated(
      padding:  EdgeInsets.all(16.r),
      itemBuilder: (context, index) {
        return OrderItemCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) =>  SizedBox(height: 10.h,),
      itemCount: products.length
    );
  }
}