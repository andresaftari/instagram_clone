import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedsCard extends StatefulWidget {
  final String? username, imageUrl, avatarUrl, likeCount;

  FeedsCard({
    required this.username,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likeCount,
  });

  @override
  _FeedsCardState createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFeedsHeader(),
        widget.imageUrl != null
            ? Image.network(
                widget.imageUrl ?? '',
                fit: BoxFit.contain,
                // width: MediaQuery.of(context).size.width,
              )
            : Image.asset(
                'assets/images/noavatar.png',
                // width: MediaQuery.of(context).size.width,
              ),
        buildFeedsFooter(),
      ],
    );
  }

  Row buildFeedsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: 48,
              height: 48,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                widget.avatarUrl ?? 'assets/images/noavatar.png',
              ),
              clipBehavior: Clip.antiAlias,
            ),
            Text(
              widget.username ?? 'Instagram User',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 4),
          child: GestureDetector(
            onTap: () => Get.snackbar(
              'Feeds',
              'Masih dalam pengembangan',
            ),
            child: Icon(Icons.more_vert, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }

  Column buildFeedsFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildStartFooterMenu(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: Row(
            children: [
              Text(
                widget.likeCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                ' likes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildStartFooterMenu() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8, top: 8),
          child: GestureDetector(
            onTap: () {

            },
            child: Icon(
              Icons.favorite_outline,
            ),
          ),
        )
      ],
    );
  }
}
