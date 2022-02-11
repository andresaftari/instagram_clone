import 'package:flutter/material.dart';

class DiscoveryCard extends StatefulWidget {
  final bool isReels, isSlideshow;
  final String contentUrl;

  DiscoveryCard({
    Key? key,
    required this.isReels,
    required this.isSlideshow,
    required this.contentUrl,
  }) : super(key: key);

  @override
  _DiscoveryCardState createState() => _DiscoveryCardState();
}

class _DiscoveryCardState extends State<DiscoveryCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
