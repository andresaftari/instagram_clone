import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoveryCard extends StatefulWidget {
  final bool isReels, isSlideshow, isPhoto;
  final int index, width, height;
  final String contentUrl;

  DiscoveryCard({
    Key? key,
    required this.isPhoto,
    required this.isReels,
    required this.isSlideshow,
    required this.contentUrl,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _DiscoveryCardState createState() => _DiscoveryCardState();
}

class _DiscoveryCardState extends State<DiscoveryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Image.network(
            widget.contentUrl,
            fit: BoxFit.cover,
            width: widget.width.toDouble(),
            height: widget.height.toDouble(),
          ),
          widget.isPhoto && widget.isSlideshow
              ? Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.filter_none, color: Colors.white, size: 20),
                )
              : Container(),
          widget.isReels
              ? Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    CupertinoIcons.play_rectangle_fill,
                    color: Colors.white,
                    size: 20,
                  ))
              : Container(),
        ],
      ),
    );
  }
}
