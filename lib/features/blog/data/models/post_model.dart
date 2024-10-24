import 'package:blog_somnio_test/features/blog/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'],
      body: json['body'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
