import 'package:ecommmerce/Controllers/Product_api_controller.dart';
import 'package:ecommmerce/Models/Product_Model.dart';
import 'package:ecommmerce/Pages/Cart/Cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  final productModel products;
  const ProductPage({super.key, required this.products});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var productcontroller = Get.put(ProductApiController());
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CartPage());
              },
              icon: Icon(Icons.shopping_cart))
        ],
        title: Text(widget.products.title!),
      ),
      body: Column(
        children: [
          Container(
              height: 400.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(widget.products.image!)))),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.products.title!,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.products.description!,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Rs ${widget.products.price!}",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Text('Free Delivery for premium members '),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          productcontroller.addtocart(widget.products, context);
                        },
                        child: Container(
                          width: double.maxFinite.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade500,
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
