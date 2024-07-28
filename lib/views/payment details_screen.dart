import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

int activeIndexPaymentItem = 0;

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var fontStyle = Theme.of(context).textTheme;
    List<String> paymentMethodsItems = [
      'assets/images/credit.svg',
      'assets/images/paypal.svg',
      'assets/images/pay.svg',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment Details',
          style: fontStyle.displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            activeIndexPaymentItem = index;
                            print(activeIndexPaymentItem);
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
                  itemCount: 3),
            )
          ],
        ),
      ),
    );
  }
}
