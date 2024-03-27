import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/productModel.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    productList.clear();
    getProducts();
  }

  getProducts() async {
    String productURL = "https://api.escuelajs.co/api/v1/products";

    final response = await http.get(Uri.parse(productURL));

    try {
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        productList.value =
            result.map((e) => ProductModel.fromJson(e)).toList();
        isLoading.value = false;
      } else {
        Get.snackbar("Error", response.statusCode.toString());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
