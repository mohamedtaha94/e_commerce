
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  final Widget ? action;
  final Color ? backgroundColor;
  final bool hideBack;
  final double ? height;
  const BasicAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor ,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80.h,
      title: title ?? const Text(''),
      titleSpacing: 0.r,
      actions: [
        action ?? Container()
      ],
      leading: hideBack ? null : IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Container(
          height: 50.h,
          width: 50.w,
          decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            shape: BoxShape.circle
          ),
          child:  Icon(
            Icons.arrow_back_ios_new,
            size: 15.r,
            color:  Colors.white
          ),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(height ?? 80.h);
}