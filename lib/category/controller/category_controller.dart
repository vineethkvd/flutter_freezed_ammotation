import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class CategoryController extends GetxController {
  final dataList = <Data>[].obs; // RxList to store categories

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories when the controller is initialized
  }

  void fetchCategories() async {
    try {
      final response = await http.post(
        Uri.parse('http://teckzy.in/bg_crop/RestApi/DealerApi/category.php'),
        body: json.encode({"api_key": "bgcrop@123"}),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) {
          print("jsonData $jsonData");
        }
        final categoryModel = CategoryModel.fromJson(jsonData);
        if (categoryModel.status == true) {
          if (categoryModel.data != null) {
            dataList.assignAll(categoryModel.data!);
          } else {
            throw Exception('Failed to load categories. Data is null.');
          }
        }
      } else {
        throw Exception(
            'Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
