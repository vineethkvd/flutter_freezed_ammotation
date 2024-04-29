import 'package:flutter/material.dart';

import '../controller/category_controller.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    print("scrren data:${controller.dataList}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(
              () {
                if (controller.dataList.value.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: controller.dataList.value.length,
                          itemBuilder: (context, index) {
                            final category = controller.dataList.value[index];
                            return ListTile(
                              title: Text(category.categoryName ?? ''),
                              subtitle: Text(category.catStatus ?? ''),
                              // Add onTap handler if needed
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
