// import 'package:blocs_app/config/config.dart';
// import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:blog_somnio_test/config/config.dart';
import 'package:blog_somnio_test/config/network/network_client.dart';
import 'package:blog_somnio_test/features/blog/data/datasources/post_datasource.dart';
import 'package:blog_somnio_test/features/blog/data/repositories/post_repository_impl.dart';
import 'package:blog_somnio_test/features/blog/domain/repositories/post_repository.dart';
import 'package:blog_somnio_test/features/blog/domain/usecases/get_posts_usecase.dart';
import 'package:blog_somnio_test/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  // getIt.registerSingleton(UsernameCubit());
  // getIt.registerSingleton(GuestsBloc());
  // getIt.registerSingleton(
  //     PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));
  // getIt.registerSingleton(HistoricLocationBloc());
  // getIt.registerSingleton(GeolocationCubit(
  //     onNewUserLocationCallback:
  //         getIt<HistoricLocationBloc>().onNewUserLocation)
  //   ..watchUserLocation());
  getIt.registerSingleton(BlogBloc()..getPosts());
  getIt.registerSingleton(RouterCubit());
  getIt.registerSingleton(NetworkUtil());

  getIt.registerLazySingleton<PostDataSourceImpl>(
      () => PostDataSourceImpl(getIt()));
  getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(getIt()));
}
