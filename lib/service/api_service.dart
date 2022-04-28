import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/products_model.dart';

class ApiService {
  var dio = Dio();
  Future<List<Product>?> getProducts() async {
    try {
      var url = 'https://dummyjson.com/products?limit=10';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var _model = ProductsModel.fromJson(response.data);

        var listData = _model.products;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
