class Reels {
  int id;
  String username, avatarUrl, contentUrl, caption, filtername, audioname;

  Reels({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.contentUrl,
    required this.caption,
    required this.audioname,
    required this.filtername,
  });

  @override
  String toString() {
    return 'Reels{id: $id, username: $username, caption: $caption, audio: $audioname}\n';
  }
}
