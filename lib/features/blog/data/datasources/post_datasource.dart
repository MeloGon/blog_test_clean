import 'package:blog_somnio_test/config/network/network_client.dart';
import 'package:blog_somnio_test/features/blog/data/models/post_model.dart';
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';

abstract class PostRemoteDataSource {
  Future<List<PostEntity>> fetchPosts();
}

class PostDataSourceImpl implements PostRemoteDataSource {
  final NetworkUtil dio;

  PostDataSourceImpl(this.dio);

  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response =
          await dio.get(url: 'https://jsonplaceholder.typicode.com/posts');
      return List<Map<String, dynamic>>.from(response)
          .map((e) => PostModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Something wrong ...');
    }
  }
}
