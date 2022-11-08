import 'package:flutter/material.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/screens/create.dart';
import 'package:globesisters_test/screens/feed.dart';
import 'package:globesisters_test/screens/profile.dart';

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late final TabController tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabCtrl,
        children: [
          FeedScreen(),
          CreatePost(),
          Profile(user: user)
        ]
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tabCtrl.index,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle),
            label: 'Create Post'
          ),
          NavigationDestination(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: user.avatar
              ),
            ),
            label: 'Profile'
          ),
        ],
        onDestinationSelected: (value) => setState(() {
          tabCtrl.animateTo(value);
        }),
      ),
    );
  }

}