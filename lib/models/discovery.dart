class Discovery {
  int id, width, height;
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
    required this.width,
    required this.height,
  });

  @override
  String toString() {
    return 'Discovery{id: $id, isPhoto: $isPhoto, isReels: $isReels\n}';
  }
}
