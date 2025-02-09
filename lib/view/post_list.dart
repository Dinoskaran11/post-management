import 'package:edus_crud_app/view/widget/post_card.dart';
import 'package:edus_crud_app/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Post Management"),
        backgroundColor: const Color.fromARGB(255, 237, 241, 248),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 98, 133, 247),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            postController.navigateToCreate();
          }),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: postController.allPosts.length,
                shrinkWrap: true,
                itemBuilder: (context, e) {
                  return PostCard(
                      post: postController.allPosts[e],
                      postController: postController,
                      index: e);
                }),
          )
        ],
      ),
    );
  }
}
