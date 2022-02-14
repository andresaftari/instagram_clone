import 'package:flutter/material.dart';
import 'package:instagram_clone/themes/theme_color.dart';

class ProfileHighlightCard extends StatefulWidget {
  final String title, thumbnail;

  const ProfileHighlightCard({
    Key? key,
    required this.title,
    required this.thumbnail,
  }) : super(key: key);

  @override
  _ProfileHighlightCardState createState() => _ProfileHighlightCardState();
}

class _ProfileHighlightCardState extends State<ProfileHighlightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: actionFillColor),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.thumbnail),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('${widget.title}', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
