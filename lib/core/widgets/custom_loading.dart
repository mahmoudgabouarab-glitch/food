import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  const CustomLoading({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColor.btn,
        radius: size ?? 6.r,
      ),
    );
  }
}
