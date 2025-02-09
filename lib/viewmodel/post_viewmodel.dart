import 'package:edus_crud_app/helper/navigator.dart';
import 'package:edus_crud_app/helper/network.dart';
import 'package:edus_crud_app/model/post_model.dart';
import 'package:edus_crud_app/view/create_post.dart';
import 'package:edus_crud_app/view/edit_post.dart';
import 'package:edus_crud_app/view/post_list.dart';
import 'package:flutter/material.dart';

class PostViewmodel extends ChangeNotifier {
  final NavigationService _navigationService;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController userId = TextEditingController();
  List<PostModel> allPosts = [];

  PostViewmodel(this._navigationService) {
    getAllPosts();
  }

  navigateToCreate() {
    _navigationService.navigate(const CreatePost());
  }

  navigateToEdit(PostModel data) {
    titleController.text = data.title.toString();
    descriptionController.text = data.body.toString();
    userId.text = data.userId.toString();
    _navigationService.navigate(EditPost(postData: data));
  }

  getAllPosts() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().get('/posts');
    print('API Response: $resData');

    if (resData != null && resData is List) {
      allPosts =
          resData.map<PostModel>((item) => PostModel.fromJson(item)).toList();
    } else {
      print('Error: No data received or data is not a list');
      allPosts = []; // Assign an empty list to prevent errors
    }
    _navigationService.goback();
    notifyListeners();
  }

  createTodo() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().post('/posts', {
      "title": titleController.text,
      "body": descriptionController.text,
      "userId": int.tryParse(userId.text)
    });

    if (resData != null) {
      getAllPosts();
      _navigationService.goback();
      _navigationService.navigate(PostList());
      titleController.clear();
      descriptionController.clear();
    } else {
      print('Error: API response was not successful or was null');
    }
  }

  editTodo(id) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().put('/posts/$id', {
      "todo_title": titleController.text,
      "todo_description": descriptionController.text
    });
    print('API Response: $resData');
    if (resData != null) {
      getAllPosts();
      _navigationService.goback();
      _navigationService.navigate(PostList());
      titleController.clear();
      descriptionController.clear();
    } else {
      print('Error: API response was not successful or was null');
    }
  }

  deleteTodo(id, index) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().delete('/api/users/$id');
    _navigationService.goback();
    if (resData) {
      allPosts.removeAt(index);
      notifyListeners();
    } else {
      print('not deleted');
    }
  }
}
