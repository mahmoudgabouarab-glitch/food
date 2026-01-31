import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class CashCard extends StatefulWidget {
  const CashCard({super.key});

  @override
  State<CashCard> createState() => _CashCardState();
}

class _CashCardState extends State<CashCard> {
  bool isSelectedCash = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          "assets/image/dollarbackgroundremoved.png",
          width: 100.w,
        ),
        title: const Text("Cash on Delivery"),
        trailing: Checkbox(
          value: isSelectedCash,
          checkColor: AppColor.textPrimary,
          activeColor: AppColor.primary,
          onChanged: (val) {
            setState(() {
              isSelectedCash = val!;
            });
          },
        ),
      ),
    );
  }
}
