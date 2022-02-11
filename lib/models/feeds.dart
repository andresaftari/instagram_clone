class Feeds {
  String username, likeCount, captions;
  String? avatarURL, imageURL;
  int id, createdAt;
  bool isLiked;

  String comments, commentBy;
  int commentCount;

  Feeds({
    required this.id,
    required this.username,
    required this.avatarURL,
    required this.imageURL,
    required this.likeCount,
    required this.isLiked,
    required this.captions,
    required this.comments,
    required this.commentBy,
    required this.commentCount,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Feeds{username: $username, id: $id, isLiked: $isLiked}\n';
  }
}
