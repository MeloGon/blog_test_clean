import 'package:blog_somnio_test/features/blog/data/datasources/post_datasource.dart';
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:blog_somnio_test/features/blog/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSourceImpl remoteDataSource;

  PostRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<PostEntity>> getPosts() async =>
      await remoteDataSource.fetchPosts();
}
