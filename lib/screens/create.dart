import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:globesisters_test/models/post.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/providers/extensions.dart';
import 'package:globesisters_test/theme/colors.dart';
import 'package:globesisters_test/widgets/buttons.dart';
import 'package:globesisters_test/widgets/post.dart';
import 'package:globesisters_test/widgets/user_info.dart';
import 'package:octo_image/octo_image.dart';
import 'package:skeletons/skeletons.dart';

class CreatePost extends StatefulWidget {

  CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  late String _url;

  List<Post> _posts = [];

  TextEditingController textCtrl = TextEditingController();

  @override
  void initState() {
    _url = _getRandomURL();
    super.initState();
  }

  String _getRandomURL() {
    return 'https://picsum.photos/seed/${List.generate(100, (index) => index).getRandom()}/600/600';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text('Create Post'),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 12,
                  right: 12
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(_url),
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Palette.of(context).surfaceVariant,
                              child: Center(
                                child: Text('There was a problem loading this image'),
                              ),
                            );
                          },
                          progressIndicatorBuilder: (context, progress) => SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      top: -20,
                      child: UserPostView(user: user)
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: textCtrl,
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'What\'s on your mind ...',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                ),
                minLines: 1,
                maxLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButton(
                      onPressed: () {
                        Post post = Post(
                          user: user,
                          imageUrl: _url,
                          caption: textCtrl.text,
                          likes: faker.randomGenerator.integer(1000),
                        );
                        textCtrl.clear();
                        _posts.add(post);
                        posts.add(post);
                        setState(() {
                          _url = _getRandomURL();
                        });
                        print(post.caption);
                      },
                      child: Text('Share')
                    )
                  ],
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => PostWidget(post: _posts[index]),
              childCount: _posts.length
            )
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          )
        ],
      ),
    );
  }

}