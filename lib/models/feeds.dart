class Feeds {
  String username, avatarURL, imageURL, likeCount, comments;
  int id;
  bool isLiked;

  Feeds({
    required this.id,
    required this.username,
    required this.avatarURL,
    required this.imageURL,
    required this.likeCount,
    required this.isLiked,
    required this.comments,
  });

  @override
  String toString() {
    return 'Feeds{username: $username, id: $id, isLiked: $isLiked}\n';
  }
}
