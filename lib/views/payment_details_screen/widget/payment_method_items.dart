import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

int activeIndexPaymentItem = 0;

class BuildPaymentMethodItems extends StatefulWidget {
  const BuildPaymentMethodItems({super.key});

  @override
  State<BuildPaymentMethodItems> createState() =>
      _BuildPaymentMethodItemsState();
}

class _BuildPaymentMethodItemsState extends State<BuildPaymentMethodItems> {
  @override
  Widget build(BuildContext context) {
    List<String> paymentMethodsItems = [
      'assets/images/credit.svg',
      'assets/images/paypal.svg',
      'assets/images/pay.svg',
    ];

    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              activeIndexPaymentItem = index;
            });
          },
          child: Container(
              width: 101.w,
              height: 60.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.50.w,
                      color: activeIndexPaymentItem == index
                          ? const Color(0xFF34A853)
                          : Colors.grey),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                shadows: activeIndexPaymentItem == index
                    ? const [
                        BoxShadow(
                          color: Color(0xFF34A853),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ]
                    : null,
              ),
              child: SvgPicture.asset(
                paymentMethodsItems[index],
                fit: BoxFit.scaleDown,
              )),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 20.h),
        itemCount: paymentMethodsItems.length,
      ),
    );
  }
}
