part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  @override
  List<Object> get props => [];
}

class BlogInitialState extends BlogState {}

class BlogLoadingState extends BlogState {}

class BlogLoadedState extends BlogState {
  final List<PostEntity> posts;

  BlogLoadedState(this.posts);

  int get postsLenght => posts.length;

  @override
  List<Object> get props => [posts];
}

class BlogErrorState extends BlogState {
  final String message;

  BlogErrorState(this.message);

  @override
  List<Object> get props => [message];
}
