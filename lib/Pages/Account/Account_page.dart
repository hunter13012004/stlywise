import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce/Controllers/Account_Page_controller.dart';
import 'package:ecommmerce/Models/User_model.dart';
import 'package:ecommmerce/Pages/Account/Settings_Page/Settings_Page.dart';
import 'package:ecommmerce/Pages/Orders/orders_page.dart';
import 'package:ecommmerce/Widgets/AccountPage_widget/CustomButton_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var accountController = Get.put(AccountPageController());
  bool isCurrencytapped = false; // for payment and currency
  bool isManageAccountTapped = false; // for manage account
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Accounts'),
      ),

      ///body starts here ===========================================>
      ///

      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            final userProfile = UserModel.fromDocument(snapshot.data!);
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.yellow]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Selected Member',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  userProfile.FirstName! +
                                      userProfile.LastName!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Select Member',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: double.maxFinite.w,
                      height: 100.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shopping for Harsh",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue.shade300,
                                    child: Text("H"),
                                  ),
                                  Text(
                                    'Harsh',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.maxFinite.w,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustombuttonWidget(
                                  text: 'Orders',
                                  icons: Icons.shopping_cart,
                                  ontap: () {
                                    Get.to(() => OrdersPage());
                                  },
                                ),
                                CustombuttonWidget(
                                  text: 'Insider',
                                  icons: Icons.help,
                                  ontap: () {},
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustombuttonWidget(
                                  text: 'Help Center',
                                  icons: Icons.headphones,
                                  ontap: () {},
                                ),
                                CustombuttonWidget(
                                  text: 'Coupons',
                                  icons: Icons.money,
                                  ontap: () {},
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      isCurrencytapped = !isCurrencytapped;
                                    });
                                  },
                                  trailing: isCurrencytapped == false
                                      ? Icon(Icons.keyboard_arrow_down_outlined)
                                      : Icon(Icons.keyboard_arrow_up_outlined),
                                  subtitle: Text(
                                    'Veiw balance and saved payment method ',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  leading: Icon(Icons.currency_exchange),
                                  title: Text(
                                    'Payment & Currency',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                if (isCurrencytapped == true)
                                  AnimatedContainer(
                                    curve: Curves.easeOut,
                                    duration: Duration(seconds: 5),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        GridView.builder(
                                          itemCount: 7,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.home),
                                                    Text('StyleWise Credit')
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          //earn & redeem ==========================>
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: ListTile(
                              trailing:
                                  Icon(Icons.keyboard_arrow_down_outlined),
                              subtitle: Text(
                                'Scan coupons,view prizes and earn rewards',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              leading: Icon(Icons.wallet_rounded),
                              title: Text(
                                'Earn & Redeem',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),

                          //=================================Manage Account
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  isManageAccountTapped =
                                      !isManageAccountTapped;
                                });
                              },
                              trailing: isManageAccountTapped == false
                                  ? Icon(Icons.keyboard_arrow_down_outlined)
                                  : Icon(Icons.keyboard_arrow_up_outlined),
                              subtitle: Text(
                                'Manage your account and saved address',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              leading: Icon(Icons.edit_document),
                              title: Text(
                                'Manage Account',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),

                          ///////////////==========================>>> Wishlist Tile
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: ListTile(
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_outlined),
                              subtitle: Text(
                                'Your most loved styles ',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              leading: Icon(Icons.favorite),
                              title: Text(
                                'Wishlist',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          //// ====================>>>>>  Setting Tile
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26)),
                            child: ListTile(
                              onTap: () {
                                Get.to(() => SettingsPage());
                              },
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_outlined),
                              subtitle: Text(
                                'Manage notifications',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              leading: Icon(Icons.settings),
                              title: Text(
                                'Settings',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: GestureDetector(
                                onTap: accountController.signUserOut,
                                child: Container(
                                  height: 50.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "LOGOUT",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
