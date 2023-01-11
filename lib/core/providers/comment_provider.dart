class CommentModel {
  final String id;
  final String commentPublisherId;
  final DateTime commentPublishTime;
  final String commentContent;

  CommentModel({
    required this.id,
    required this.commentPublisherId,
    required this.commentPublishTime,
    required this.commentContent,
  });
}

class CommentProvider {
  final List _comments = [];
  get comments => [...comments];

  CommentModel findCommentById(commentId) =>
      _comments.firstWhere((comment) => comment.id == commentId);
}
