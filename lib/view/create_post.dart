import 'package:edus_crud_app/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _PostCreateState();
}

class _PostCreateState extends State<CreatePost> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("POST CREATE"),
      ),
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 400,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        controller: postController.titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required Field";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Title",
                            hintStyle: TextStyle(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        controller: postController.descriptionController,
                        minLines: 3,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required Field";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Description",
                            hintStyle: TextStyle(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        controller: postController.userId,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required Field";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter UserID",
                            hintStyle: TextStyle(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        postController.createTodo();
                      }
                    },
                    child: Container(
                      width: 400,
                      height: 55,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
