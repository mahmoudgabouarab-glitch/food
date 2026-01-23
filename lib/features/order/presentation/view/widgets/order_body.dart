import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtnNavBar(
        text: "Pay Now",
        ontap: () {
          
        },
        title: "\$18.2",
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 18.h),
              const Text("Order summary"),
              SizedBox(height: 20.h),
              const Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("data"), Text("data")],
              ),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("data"), Text("data")],
              ),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("data"), Text("data")],
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 33.h),
              const Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("data"), Text("data")],
              ),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("data"), Text("data")],
              ),
              SizedBox(height: 67.h),
              const Text("Payment methods"),
              SizedBox(height: 22.h),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "assets/image/dollarbackgroundremoved.png",
                    width: 100.w,
                  ),
                  title: const Text("Cash on Delivery"),
                  trailing: Checkbox(value: false, onChanged: (val) {}),
                ),
              ),
              SizedBox(height: 27.h),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/visa.png", width: 100.w),
                  title: const Text("Debit card"),
                  subtitle: const Text("3566 **** **** 0505"),
                ),
              ),
              SizedBox(height: 16.h),
              CheckboxListTile(
                value: false,
                onChanged: (val) {},
                title: const Text("Save card details for future payments"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
