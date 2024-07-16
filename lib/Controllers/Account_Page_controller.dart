import 'package:ecommmerce/Pages/Login/StartPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountPageController extends GetxController {
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(() => Startpage());
  }
}
