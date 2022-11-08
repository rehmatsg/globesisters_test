import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globesisters_test/models/post.dart';
import 'package:globesisters_test/theme/colors.dart';
import 'package:globesisters_test/widgets/user_info.dart';
import 'package:like_button/like_button.dart';
import 'package:octo_image/octo_image.dart';
import 'package:skeletons/skeletons.dart';

class PostWidget extends StatefulWidget {

  PostWidget({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with AutomaticKeepAliveClientMixin {

  late Post post;

  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    image: CachedNetworkImageProvider(post.imageUrl),
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
                child: UserPostView(user: post.user)
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LikeButton(
                size: 20,
                likeCountPadding: EdgeInsets.only(left: 6),
                likeCount: post.likes,
                bubblesColor: BubblesColor(dotPrimaryColor: Colors.red, dotSecondaryColor: Colors.blue),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () { },
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      CupertinoIcons.chat_bubble_fill,
                      size: 20,
                      color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.grey : Colors.grey[500],
                    ),
                    tooltip: 'Comment',
                  ),
                  IconButton(
                    onPressed: () { },
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      CupertinoIcons.bookmark_fill,
                      size: 20,
                      color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.grey : Colors.grey[500],
                    ),
                    tooltip: 'Bookmark',
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 8),
          child: Text(
            post.caption,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
  
}


