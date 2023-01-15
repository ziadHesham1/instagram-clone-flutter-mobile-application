import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/core/globals/global_variables.dart';

class CommentModel {
  final String id;
  final String userId;
  final DateTime publishTime;
  final String commentContent;

  CommentModel({
    required this.id,
    required this.userId,
    required this.publishTime,
    required this.commentContent,
  });
}

class CommentsProvider with ChangeNotifier {

/*   final List<CommentModel> _comments = [
    CommentModel(
      id: 'Commentid1',
      userId: 'ZiadId1',
      publishTime: DateTime.now(),
      commentContent:
          'ZiadId1 comments :  ${GlobalVariables.longText}',
    ),
    CommentModel(
      id: 'Commentid2',
      userId: 'TarekId2',
      publishTime: DateTime.now(),
      commentContent: 'TarekId2 : ${GlobalVariables.longText}',
    ),
    CommentModel(
      id: 'Commentid3',
      userId: 'MostafaId2',
      publishTime: DateTime.now(),
      commentContent: 'MostafaId2 commentContent',
    ),
    CommentModel(
      id: 'Commentid5',
      userId: 'ZiadId1',
      publishTime: DateTime.now(),
      commentContent: 'ZiadId1 commentContent',
    ),
  ];

  List<CommentModel> get comments => [..._comments];

  CommentModel findCommentById(commentPublisherId) =>
      _comments.firstWhere((comments) => comments.id == commentPublisherId);
 */}
