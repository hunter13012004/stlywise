import 'package:ecommmerce/Pages/Account/Account_page.dart';
import 'package:ecommmerce/Pages/Auth/Auth.dart';
import 'package:ecommmerce/Pages/Home/Home.dart';
import 'package:ecommmerce/Pages/Login/Login_Screen.dart';
import 'package:ecommmerce/Pages/Login/SignUp_Screen.dart';
import 'package:ecommmerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 800),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
