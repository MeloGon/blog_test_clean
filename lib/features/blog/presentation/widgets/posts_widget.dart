import 'package:blog_somnio_test/core/extensions/space_extension.dart';
import 'package:blog_somnio_test/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(builder: (context, state) {
      switch (state) {
        case BlogLoadingState():
          return const Center(
            child: CircularProgressIndicator(),
          );

        case BlogErrorState():
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );

        case BlogLoadedState():
          return ListView.builder(
            itemCount: state.postsLenght,
            itemBuilder: (context, index) {
              final postItem = state.posts[index];
              return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Chip(
                              backgroundColor: const Color(0xff251d81),
                              label: const Text(
                                'Community',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            20.h,
                            Text(
                              postItem.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            10.h,
                            Text(postItem.body),
                            20.h,
                            Row(
                              children: [
                                const Text('Read more'),
                                5.w,
                                const Icon(Icons.arrow_forward_rounded)
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://cdn.prod.website-files.com/64c308983b98e1ea07cc2765/66ffee8a215e9f31a595b65b_SF%20Tech%20Week%20.webp",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ));
            },
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}
