import 'package:flutter/material.dart';
import 'package:InstaClone/core/providers/comment_provider.dart';

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
  PostsProvider() {
    print('PostsProvider constructor called');
  }

  final List<PostModel> _posts = [];
  /*  final List<PostModel> _posts = [
    PostModel(
      id: 'Postid1',
      userId: 'AhmedId1',
      postPublishTime: DateTime.now(),
      postContent:
          'I found something to share with you .. please let me  know if it bad ',
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
  */
  List<PostModel> get posts => [..._posts];

  List<PostModel> userPosts(userId) {
    return _posts.where((post) => post.userId == userId).toList();
  }

  void addPost(String postId, String userId, DateTime postPublishTime,
      String postContent) {
    _posts.add(PostModel(
      id: postId,
      userId: userId,
      postPublishTime: postPublishTime,
      postContent: postContent,
      comments: [],
      likesNumber: 0,
    ));
    print(
        'We caught the user withId $userId adding a post contains $postContent');

    notifyListeners();
  }

  PostModel findPostById(postId) {
    return _posts.firstWhere((post) => post.id == postId);
  }

  void addComment(postId, commentId, userId, publishTime, commentContent) {
    var firstWhere = findPostById(postId);
    firstWhere.comments.add(CommentModel(
        id: commentId,
        userId: userId,
        publishTime: publishTime,
        commentContent: commentContent));
    print('comment $commentContent is added to post with id $postId');
    notifyListeners();
  }
}
