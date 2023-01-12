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
  final List<CommentModel> _comments = [
    CommentModel(
      id: 'Commentid1',
      commentPublisherId: 'ZiadId1',
      commentPublishTime: DateTime.now(),
      commentContent: 'ZiadId1 comments : Don\'t small us',
    ),
    CommentModel(
      id: 'Commentid2',
      commentPublisherId: 'TarekId2',
      commentPublishTime: DateTime.now(),
      commentContent: 'TarekId2 commentContent',
    ),
    CommentModel(
      id: 'Commentid3',
      commentPublisherId: 'MostafaId2',
      commentPublishTime: DateTime.now(),
      commentContent: 'MostafaId2 commentContent',
    ),
    CommentModel(
      id: 'Commentid5',
      commentPublisherId: 'ZiadId1',
      commentPublishTime: DateTime.now(),
      commentContent: 'ZiadId1 commentContent',
    ),
  ];

  get comments => [...comments];

  CommentModel findCommentById(commentPublisherId) =>
      _comments.firstWhere((comments) => comments.id == commentPublisherId);
}
