
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/my_favorties_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Settings'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            MyFavortiesTile(),
            SizedBox(height: 15.h,),
            MyOrdersTile()
          ],
        ),
      ),
    );
  }
}