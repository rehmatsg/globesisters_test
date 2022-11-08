import 'package:flutter/material.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/screens/home.dart';
import 'package:globesisters_test/theme/theme.dart';

import 'package:globesisters_test/models/post.dart';

void main() {
  user = User.random();
  posts = [];
  for (int i in List.generate(20, (index) => index)) {
    posts.add(Post.random());
  }
  runApp(const App());
}

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.build(brightness: Brightness.light),
      darkTheme: AppTheme.build(brightness: Brightness.dark),
      title: 'GlobeSisters Test',
      home: Home(),
    );
  }

}