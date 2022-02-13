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

class ProfileFeeds {
  int id;
  String imageURL;
  bool isPhoto, isReels, isSlideshows, isVideo, isIGTV;

  ProfileFeeds({
    required this.id,
    required this.imageURL,
    required this.isPhoto,
    required this.isVideo,
    required this.isReels,
    required this.isIGTV,
    required this.isSlideshows,
  });

  @override
  String toString() {
    return 'ProfileFeeds{id: $id, photo: $isPhoto, reels: $isReels, slide: $isSlideshows, video: $isVideo, IGTV: $isIGTV}\n';
  }
}

class ProfileHighlights {
  int id;
  String thumbnail, title;

  ProfileHighlights({
    required this.id,
    required this.thumbnail,
    required this.title,
  });

  @override
  String toString() {
    return 'ProfileHighlights{id: $id, title: $title}\n';
  }
}
