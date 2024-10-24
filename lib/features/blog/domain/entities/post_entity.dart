import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int userId, id;
  final String title, body;

  const PostEntity(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [userId, id, title, body];
}
