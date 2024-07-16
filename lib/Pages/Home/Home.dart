import 'package:carousel_images/carousel_images.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommmerce/Controllers/Product_api_controller.dart';
import 'package:ecommmerce/Pages/Account/Account_page.dart';
import 'package:ecommmerce/Pages/Favorite/Favorite_page.dart';
import 'package:ecommmerce/Pages/Notification/Notification_page.dart';
import 'package:ecommmerce/Pages/Product_Page.dart/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var porductController = Get.put(ProductApiController());
  @override
  void initState() {
    porductController.fetchData();
    super.initState();
  }

  bool isCategorySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        title: Text(
          "STYLEWISE",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => FavoritePage());
                  },
                  icon: Icon(
                    Icons.notifications_none,
                    size: 24.sp,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(() => NotificationPage());
                  },
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 24.sp,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(() => AccountPage());
                  },
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 24.sp,
                  ))
            ],
          )
        ],
      ),

//////
      ///
      ///
      ///
      ///Body Starts here ===================================>>>>>>>>>>>>>>>>>>>>>

      body: Center(
          child: Container(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: porductController.Categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.w,
                        decoration: BoxDecoration(color: Colors.white30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCategorySelected = !isCategorySelected;
                                });
                              },
                              child: Container(
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: isCategorySelected == true
                                            ? Colors.green
                                            : Colors.black87)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      porductController.Categories[index],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  height: 400.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: porductController.productsList.length,
                    itemBuilder: (context, index) => Container(
                      height: 400.h,
                      width: 500.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: CarouselImages(
                          cachedNetworkImage: true,
                          onTap: (index) {
                            Get.to(() => ProductPage(
                                products:
                                    porductController.productsList[index]));
                          },
                          listImages: [
                            porductController.productsList[index].image!
                          ],
                          height: 400.h),
                    ),
                  ),
                ),
                DotsIndicator(
                  dotsCount: 5,
                ),
                Container(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: porductController.productsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.w,
                        decoration: BoxDecoration(color: Colors.white30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              porductController.productsList[index].title!,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),

                //=========================================Featuring Brands =============>
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Featured Brands',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: porductController.productsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProductPage(
                                products:
                                    porductController.productsList[index]));
                          },
                          child: Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 100.h,
                                    child: Image.network(porductController
                                        .productsList[index].image!),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      porductController
                                          .productsList[index].title!,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  porductController
                                      .productsList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "Rs.${porductController.productsList[index].price!}")
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
