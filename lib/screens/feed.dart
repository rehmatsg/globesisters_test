import 'package:flutter/material.dart';
import 'package:globesisters_test/models/post.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/widgets/post.dart';

class FeedScreen extends StatefulWidget {

  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GlobeSisters Test'
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 13, bottom: 13),
            child: GestureDetector(
              onTap: () => user.toProfile(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: user.avatar,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => PostWidget(
          post: posts[index]
        ),
        itemCount: posts.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Divider(
            height: 0,
          ),
        )
      )
    );
  }
}