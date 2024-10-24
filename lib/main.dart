import 'package:blog_somnio_test/config/config.dart';
import 'package:blog_somnio_test/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_somnio_test/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RouterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<BlogBloc>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterCubit = context.watch<RouterCubit>().state;
    return MaterialApp.router(
      title: 'Blog Somnio',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterCubit,
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}
