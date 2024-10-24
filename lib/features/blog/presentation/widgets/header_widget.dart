import 'package:blog_somnio_test/core/extensions.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Blog',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          10.h,
          const Text(
            'example of subtitle',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
