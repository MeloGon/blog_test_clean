
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:blog_somnio_test/features/blog/domain/usecases/get_posts_usecase.dart';
import 'package:blog_somnio_test/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'blog_bloc_test.mocks.dart'; 

@GenerateMocks([GetPostsUseCase])
void main() {
  late BlogBloc bloc;
  late MockGetPostsUseCase mockGetPostsUseCase;

  setUp(() {
    mockGetPostsUseCase = MockGetPostsUseCase();
    bloc = BlogBloc();
  });

  final List<PostEntity> tPosts = [
    const PostEntity(
        userId: 1, id: 1, title: 'Post 1', body: 'Content of post 1'),
    const PostEntity(
        userId: 1, id: 2, title: 'Post 2', body: 'Content of post 2'),
  ];

  test('initial state', () {
    expect(bloc.state, equals(BlogInitialState()));
  });

//! This test I have to fix 😖
  blocTest<BlogBloc, BlogState>(
    'debería emitir [BlogLoadingState, BlogLoadedState] cuando los posts son obtenidos exitosamente',
    build: () {
      when(mockGetPostsUseCase.call()).thenAnswer((_) async => tPosts);
      return bloc;
    },
    act: (bloc) => bloc.add(GetPostsForBlogEvent()),
    expect: () => [
      BlogLoadingState(),
      BlogLoadedState(tPosts),
    ],
  );

  blocTest<BlogBloc, BlogState>(
    'debería emitir [BlogLoadingState, BlogErrorState] cuando ocurre un error al obtener los posts',
    build: () {
      when(mockGetPostsUseCase.call()).thenThrow(Exception('Error de red'));
      return bloc;
    },
    act: (bloc) => bloc.add(GetPostsForBlogEvent()),
    expect: () => [
      BlogLoadingState(),
      BlogErrorState('Ups something went wrong ...'),
    ],
  );
}
