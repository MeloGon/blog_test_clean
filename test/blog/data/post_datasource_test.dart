import 'package:blog_somnio_test/features/blog/data/datasources/post_datasource.dart';
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_datasource_test.mocks.dart';

class MockPostDatasource extends Mock implements PostRemoteDataSource {}

@GenerateMocks(<Type>[MockPostDatasource])
void main() {
  late MockMockPostDatasource mockPostDataSource;
  final List<PostEntity> mockPosts = <PostEntity>[
    const PostEntity(
        userId: 1,
        id: 3,
        title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
        body:
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut")
  ];

  setUp(() {
    mockPostDataSource = MockMockPostDatasource();
  });

  test('fetch all post from api', () async {
    when(mockPostDataSource.fetchPosts()).thenAnswer((_) async => mockPosts);
    expect(mockPosts, isNotNull);
    expect(mockPosts.runtimeType, List<PostEntity>);
  });
}
