import 'package:flutter/material.dart';

class ProfileHighlights extends StatefulWidget {
  final String title;
  final String thumbnail;

  ProfileHighlights({
    Key? key,
    required this.title,
    required this.thumbnail,
  }) : super(key: key);

  @override
  _ProfileHighlightsState createState() => _ProfileHighlightsState();
}

class _ProfileHighlightsState extends State<ProfileHighlights> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
