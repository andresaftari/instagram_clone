class Discovery {
  int id;
  String contentUrl;
  bool isPhoto;
  bool isReels;
  bool isSlideshows;

  Discovery({
    required this.id,
    required this.contentUrl,
    required this.isPhoto,
    required this.isReels,
    required this.isSlideshows,
  });

  @override
  String toString() {
    return 'Discovery{id: $id, isPhoto: $isPhoto, isReels: $isReels}\n';
  }
}
