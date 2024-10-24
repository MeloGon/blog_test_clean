import 'package:bloc/bloc.dart';
import 'package:blog_somnio_test/features/pages.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BlogScreen(),
  ),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);

  //todo:  we can implement methods to custom navigation
}
