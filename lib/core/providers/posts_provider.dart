import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/comment_provider.dart';
class PostModel {
  final String id;
  final String userName;
  final DateTime dateTime;
  // start with text only
  final String postContent;
  final List<CommentModel> comments;
  // start with only a counter
  /* 'username' : 3 , 'username2' : 1 .....*/
  final int likesNumber;

  PostModel({
    required this.id,
    required this.userName,
    required this.dateTime,
    required this.postContent,
    required this.comments,
    required this.likesNumber,
  });
}

class PostsProvider with ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(
      id: 'id1',
      userName: 'Ziad Hesham',
      dateTime: DateTime.now(),
      postContent: 'Don\'t small us',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'id2',
      userName: 'Mohamed aly',
      dateTime: DateTime.now(),
      postContent: 'postContent',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'id3',
      userName: 'Mostafa Ramadan',
      dateTime: DateTime.now(),
      postContent: 'postContent',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'id5',
      userName: 'Mohamed Tarek',
      dateTime: DateTime.now(),
      postContent: 'postContent',
      comments: [],
      likesNumber: 15,
    ),
  ];
  get posts => [..._posts];

  void addPost(PostModel newPost) {
    _posts.add(newPost);
    notifyListeners();
  }

  PostModel findPostById(postId) =>
      _posts.firstWhere((post) => post.id == postId);

  void addComment(postId, CommentModel newComment) {
    var firstWhere = findPostById(postId);
    firstWhere.comments.add(newComment);
    notifyListeners();
  }
}
