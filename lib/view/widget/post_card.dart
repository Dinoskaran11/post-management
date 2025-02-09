import 'package:edus_crud_app/model/post_model.dart';
import 'package:edus_crud_app/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final PostViewmodel postController;
  final int index;

  const PostCard({
    super.key,
    required this.post,
    required this.postController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          post.title.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body.toString()),
        trailing: PopupMenuButton(
          child: Icon(Icons.more_vert),
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.blue),
                  SizedBox(width: 5),
                  Text("EDIT"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 5),
                  Text("DELETE"),
                ],
              ),
            ),
          ],
          onSelected: (String value) {
            if (value == 'edit') {
              postController.navigateToEdit(post);
            }
            if (value == 'delete') {
              postController.deletePost(post.id.toString(), index);
            }
          },
        ),
      ),
    );
  }
}
