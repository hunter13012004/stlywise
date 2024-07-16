import 'dart:convert';
import 'package:ecommmerce/Models/Product_Model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://still-hollows-57581-85b237c6b221.herokuapp.com';

  Future<List<productModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + '/products'));
      if (response.statusCode == 200) {
        List<dynamic> decoded = json.decode(response.body);
        List<productModel> products =
            decoded.map((dynamic item) => productModel.fromMap(item)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e.toString());
      // Return an empty list in case of error
      return [];
    }
  }
}
