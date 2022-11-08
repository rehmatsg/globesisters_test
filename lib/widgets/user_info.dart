import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/theme/colors.dart';

class UserPostView extends StatefulWidget {

  UserPostView({
    Key? key,
    required this.user,
    this.margin,
  }) : super(key: key);

  final User user;
  final EdgeInsetsGeometry? margin;

  @override
  State<UserPostView> createState() => _UserPostViewState();
}

class _UserPostViewState extends State<UserPostView> {

  late User user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GestureDetector(
          onTap: () => user.toProfile(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Palette.of(context).surfaceVariant.withOpacity(0.3),
              padding: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: user.avatar
                  ),
                  SizedBox(width: 6,),
                  Text(
                    user.displayName,
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}