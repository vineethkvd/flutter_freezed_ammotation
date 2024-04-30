import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class CategoryController extends GetxController {
  final RxList<Data> dataList = <Data>[].obs; // RxList to store categories
  final categoryModel = CategoryModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories when the controller is initialized
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http.post(
        Uri.parse('http://teckzy.in/bg_crop/RestApi/DealerApi/category.php'),
        body: json.encode({"api_key": "bgcrop@123"}),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        categoryModel.value = CategoryModel.fromJson(responseData); // Assign to observable using .value

        if (kDebugMode) {
          print("responseData: $responseData");
        }
        if (categoryModel.value.status == true) { // Access value using .value
          dataList.assignAll(categoryModel.value.data!);
          if (kDebugMode) {
            print("Fetched categories: ${dataList.length}");
            print("First category name: ${dataList.first.categoryName}");
          }
        } else {
          throw Exception('Failed to load categories: ${categoryModel.value.message}');
        }
      } else {
        throw Exception(
            'Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow; // Rethrow the exception for higher-level error handling
    }
  }
}
