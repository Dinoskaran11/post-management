import 'package:edus_crud_app/helper/navigator.dart';
import 'package:edus_crud_app/view/post_list.dart';
import 'package:edus_crud_app/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostViewmodel>(create: (_) => PostViewmodel(NavigationService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        debugShowCheckedModeBanner: false,
        home: PostList(),
      ),
      );
  }
}

