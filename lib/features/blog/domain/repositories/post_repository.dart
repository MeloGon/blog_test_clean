import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
}
