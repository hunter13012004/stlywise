import 'package:ecommmerce/Models/Product_Model.dart';
import 'package:ecommmerce/Services/Product_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProductApiController extends GetxController {
  List<productModel> productsList = <productModel>[].obs;
  List Categories =
      ['Electronics', 'Clothes', 'Men', 'Women', 'Kids', 'Games'].obs;
  List<productModel> cartList = <productModel>[].obs;
  int counter = 1;
  int intialamount = 0;
  var productsByBrand = <String, List<productModel>>{}.obs;

  void fetchData() async {
    var allProducts = await ApiService().fetchProducts();

    productsList.addAll(allProducts);
    update();
  }

  void groupProductsByBrand() {
    productsByBrand.clear();
    for (var product in productsList) {
      if (!productsByBrand.containsKey(product.brand)) {
        productsByBrand[product.brand!] = [];
      }
      productsByBrand[product.brand]!.add(product);
    }
  }

  void addtocart(productModel product, BuildContext context) {
    cartList.add(product);
    update();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('1 Item added to the cart')));
  }

  void removeFromCart(productModel product, BuildContext context) {
    cartList.remove(product);
    update();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('1 Item removed from the cart')));
  }

  void increaseAmount() {
    if (counter == 1) {
      counter++;
      update();
    } else {
      null;
    }
  }

  void decreaseAmount() {
    if (counter <= 1) {
      counter--;
      update();
    } else {
      null;
    }
  }

  // void calculateTotalAmount(int index) {
  //   int sum = 0;
  //   sum +=
  // }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
