import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostController extends GetxController {
  var posts = <PostsModel>[].obs; // RxList to store posts

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Fetch posts when the controller is initialized
  }

  void fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      posts.assignAll(data.map((json) => PostsModel.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
