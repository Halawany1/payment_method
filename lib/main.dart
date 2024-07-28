import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/views/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Checkout',
          home: const CartScreen(),
          theme: ThemeData(
            textTheme: TextTheme(
              displayLarge:  TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
              titleMedium: TextStyle(
                color: Colors.black.withOpacity(0.699999988079071),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        );
      },
    );
  }
}
