import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/post_controller.dart';
class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(() {
        if (controller.posts.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              final post = controller.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                onTap: () {
                  // Handle tap on post
                  // For example, you can navigate to a detailed view
                  // Get.toNamed('/post_detail', arguments: post);
                },
              );
            },
          );
        }
      }),
    );
  }
}
