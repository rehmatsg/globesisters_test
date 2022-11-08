import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:globesisters_test/providers/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globesisters_test/screens/profile.dart';

late final User user;

class User {

  final String photoUrl;
  final String displayName;
  final String email;
  final int? age;
  final String bio;
  final String username;
  final int followers;
  final int following;

  const User({
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.displayName,
    this.age,
    required this.bio,
    this.followers = 0,
    this.following = 0
  });

  factory User.random() {
    return User(
      email: faker.internet.email(),
      username: faker.internet.userName(),
      photoUrl: 'https://avatars.dicebear.com/api/micah/${List.generate(100, (index) => index).getRandom()}.svg?b=%23a8c6fe',
      displayName: faker.person.name(),
      age: faker.randomGenerator.integer(100),
      bio: faker.lorem.sentence(),
      followers: faker.randomGenerator.integer(1000000),
      following: faker.randomGenerator.integer(1000000)
    );
  }

  ImageProvider get provider => CachedNetworkImageProvider(photoUrl);

  Widget get avatar => SvgPicture.network(
    photoUrl,
    width: 30,
    height: 30,
    fit: BoxFit.cover,
  );

  void toProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Profile(user: this),)
    );
  }

}