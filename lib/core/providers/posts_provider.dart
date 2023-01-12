import 'package:flutter/material.dart';
import 'package:instagram_clone/core/providers/comment_provider.dart';
import 'package:instagram_clone/core/providers/users_provider.dart';

class PostModel {
  final String id;
  final String userId;
  final DateTime postPublishTime;
  // start with text only
  final String postContent;
  final List<CommentModel> comments;
  // start with only a counter
  /* 'username' : 3 , 'username2' : 1 .....*/
  final int likesNumber;

  PostModel({
    required this.id,
    required this.userId,
    required this.postPublishTime,
    required this.postContent,
    required this.comments,
    required this.likesNumber,
  });
}

class PostsProvider with ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(
      id: 'Postid1',
      userId: 'ZiadId1',
      postPublishTime: DateTime.now(),
      postContent: 'Don\'t small us',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'Postid2',
      userId: 'TarekId2',
      postPublishTime: DateTime.now(),
      postContent: 'postContent',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'Postid3',
      userId: 'MostafaId2',
      postPublishTime: DateTime.now(),
      postContent: 'postContent',
      comments: [],
      likesNumber: 15,
    ),
    PostModel(
      id: 'Postid5',
      userId: 'ZiadId1',
      postPublishTime: DateTime.now(),
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
