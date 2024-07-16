import 'package:ecommmerce/Controllers/Product_api_controller.dart';
import 'package:ecommmerce/Models/Product_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String quantity;
  final String imagepath;
  final productModel product;
  const CartTile(
      {super.key,
      required this.title,
      required this.price,
      required this.description,
      required this.quantity,
      required this.imagepath,
      required this.product});

  @override
  Widget build(BuildContext context) {
    var productcontroller = Get.put(ProductApiController());
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                child: Image.network(imagepath),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black45),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Rs.${price}',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(
                    () => Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                          Text(productcontroller.counter.toString()),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        productcontroller.removeFromCart(product, context);
                      },
                      icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
