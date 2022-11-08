import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globesisters_test/models/post.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/providers/extensions.dart';
import 'package:globesisters_test/widgets/chip.dart';
import 'package:globesisters_test/widgets/post.dart';

import '../widgets/buttons.dart';

class Profile extends StatefulWidget {

  Profile({
    Key? key,
    required this.user
  }) : super(key: key);

  final User user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late final List<Post> posts;
  late User _user;

  @override
  void initState() {
    _user = widget.user;
    posts = [];
    for (int i in List.generate(4, (index) => index)) {
      posts.add(Post.random());
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: _user.avatar
                        ),
                      ),
                      SecondaryButton(
                        child: Text(
                          'Follow'
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                        onPressed: () async { },
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    _user.displayName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 12,),
                  Text(
                    _user.bio
                  ),
                  SizedBox(height: 9),
                  Text.rich(
                    TextSpan(
                      // text: 'Hello', // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: _user.followers.inInternationalFormat(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ' followers •',
                        ),
                        TextSpan(
                          text: ' ${_user.following.inInternationalFormat()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ' following',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9,),
                  Wrap(
                    spacing: 6,
                    children: [
                      NewChip(
                        icon: CupertinoIcons.link,
                        text: 'Website'
                      ),
                      NewChip(
                        icon: CupertinoIcons.link,
                        text: 'Twitter'
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => PostWidget(
                post: posts[index]
              ),
              childCount: posts.length
            )
          )
        ],
      ),
    );
  }

}