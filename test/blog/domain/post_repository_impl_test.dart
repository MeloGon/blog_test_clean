// import 'package:dartz/dartz.dart';
import 'package:blog_somnio_test/features/blog/data/repositories/post_repository_impl.dart';
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_impl_test.mocks.dart';

@GenerateMocks(<Type>[PostRepositoryImpl])
void main() {
  late MockPostRepositoryImpl mockPostRepositoryImpl;
  final List<PostEntity> mockPosts = <PostEntity>[
    const PostEntity(
        userId: 1,
        id: 3,
        title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
        body:
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut")
  ];

  setUp(() {
    mockPostRepositoryImpl = MockPostRepositoryImpl();
  });

  test('request posts should fetch posts', () async {
    when(mockPostRepositoryImpl.getPosts()).thenAnswer((_) async => mockPosts);
  });
}
