import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/presentation/auth/pages/siginin.dart';
import 'package:e_commerce/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/my_favorties_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            MyFavortiesTile(),
            SizedBox(height: 15.h),
            MyOrdersTile(),
            SizedBox(height: 15.h),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
