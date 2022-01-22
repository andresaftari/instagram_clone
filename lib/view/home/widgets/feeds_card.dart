import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:intl/intl.dart';

class FeedsCard extends StatefulWidget {
  final String? username, imageUrl, avatarUrl, likes, comments;
  final int? id;

  FeedsCard({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  _FeedsCardState createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var count = 0;

    if (widget.likes != null) {
      count = int.parse(widget.likes.toString());
    }

    var like = NumberFormat.decimalPattern().format(count);

    return Column(
      children: [
        buildFeedsHeader(),
        widget.imageUrl != null
            ? Image.network(widget.imageUrl ?? '', fit: BoxFit.contain)
            : Image.asset('assets/images/noavatar.png'),
        buildFeedsFooter(like),
        buildFeedsComments(),
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
              child: GestureDetector(
                onTap: () => Get.snackbar('Test', 'Tapped id: ${widget.id}'),
                child: Image.asset(
                  widget.avatarUrl ?? 'assets/images/noavatar.png',
                ),
              ),
              clipBehavior: Clip.antiAlias,
            ),
            Text(
              widget.username ?? 'Instagram User',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
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

  Column buildFeedsFooter(String likeCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildStartFooterMenu(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              Text(
                likeCount.toString(),
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
          padding: EdgeInsets.only(right: 16, top: 8),
          child: Obx(
            () => GestureDetector(
              onTap: () {
                print('tapped ${widget.id}');
                _homeController.toggleLikedFeed(widget.id);
                // _homeController.setFeedsLike(widget.id);

                Get.snackbar(
                  'Likes',
                  'Masih dalam pengembangan',
                  duration: Duration(seconds: 1),
                );
              },
              child: _homeController.isFeedLiked.value
                  ? Icon(Icons.favorite, size: 30, color: Colors.redAccent)
                  : Icon(Icons.favorite_outline, size: 30, color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16),
          child: GestureDetector(
            onTap: () => Get.snackbar(
              'Comments',
              'Masih dalam pengembangan',
              duration: Duration(seconds: 2),
            ),
            child: Transform(
              transform: Matrix4.rotationY(math.pi),
              alignment: Alignment.center,
              child: Icon(
                CupertinoIcons.conversation_bubble,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: GestureDetector(
            onTap: () => Get.snackbar(
              'Send to dm',
              'Masih dalam pengembangan',
              duration: Duration(seconds: 2),
            ),
            child: Image.asset(
              'assets/images/ic_send.png',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Column buildFeedsComments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            text: TextSpan(
                text: '${widget.username} ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${widget.comments} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
