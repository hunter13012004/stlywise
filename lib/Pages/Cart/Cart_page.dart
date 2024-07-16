import 'package:ecommmerce/Controllers/Product_api_controller.dart';
import 'package:ecommmerce/Pages/Cart/Utils/Cart_Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  var productcontroller = Get.put(ProductApiController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Obx(
          () => Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: productcontroller.cartList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartTile(
                                product: productcontroller.cartList[index],
                                imagepath:
                                    productcontroller.cartList[index].image!,
                                title: productcontroller.cartList[index].title!,
                                price: productcontroller.cartList[index].price!,
                                description: productcontroller
                                    .cartList[index].description!,
                                quantity: '1'));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.black),
                                )),
                            Text(
                              productcontroller.intialamount.toString(),
                              style: TextStyle(fontSize: 18.sp),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
