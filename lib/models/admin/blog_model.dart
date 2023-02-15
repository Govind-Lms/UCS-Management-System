import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String blogId;
  final String title;
  final String desc;
  final String subject;
  final Timestamp timestamp;

  Blog({
    required this.blogId,
    required this.title,
    required this.desc,
    required this.subject,
    required this.timestamp,
  });
}
