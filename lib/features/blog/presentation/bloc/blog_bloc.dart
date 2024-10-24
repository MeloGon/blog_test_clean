import 'package:bloc/bloc.dart';
import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';
import 'package:blog_somnio_test/features/blog/domain/usecases/get_posts_usecase.dart';
import 'package:blog_somnio_test/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitialState()) {
    on<GetPostsForBlogEvent>(_getPostsForBlogHandler);
  }

  void getPosts() {
    add(GetPostsForBlogEvent());
  }

  Future<void> _getPostsForBlogHandler(
      GetPostsForBlogEvent event, Emitter<BlogState> emit) async {
    try {
      emit(BlogLoadingState());
      List<PostEntity> posts = await getIt<GetPostsUseCase>().call();
      emit(BlogLoadedState(posts));
    } catch (e) {
      emit(BlogErrorState("Ups something went wrong ..."));
    }
  }
}
