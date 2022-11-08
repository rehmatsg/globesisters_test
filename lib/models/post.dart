import 'package:faker/faker.dart';
import 'package:globesisters_test/models/user.dart';
import 'package:globesisters_test/providers/extensions.dart';

late List<Post> posts;

class Post {

  final User user;
  final String imageUrl;
  final String caption;
  final int likes;
  
  const Post({
    required this.user,
    required this.imageUrl,
    required this.caption,
    required this.likes
  });

  factory Post.random() {
    return Post(
      user: User.random(),
      imageUrl: 'https://picsum.photos/seed/${List.generate(100, (index) => index).getRandom()}/600/600',
      caption: faker.lorem.sentence(),
      likes: faker.randomGenerator.integer(1000)
    );
  }

}