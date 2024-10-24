import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:blog_somnio_test/features/blog/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<PostEntity>> call() async {
    return await repository.getPosts();
  }
}
