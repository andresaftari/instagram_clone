import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/data/domain/controller/home_controller.dart';
import 'package:instagram_clone/themes/theme_color.dart';
import 'package:instagram_clone/utils/snackbar_util.dart';
import 'package:intl/intl.dart';

class FeedsCard extends StatefulWidget {
  final String username, likes, captions, comments, commentBy;
  final String? imageUrl, avatarUrl;
  final int id, commentCount, createdAt;

  late final Function onDecTap;

  FeedsCard({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likes,
    required this.captions,
    required this.comments,
    required this.commentBy,
    required this.commentCount,
    required this.createdAt,
  });

  @override
  _FeedsCardState createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var count = 0;
    var created = 0.0;

    if (widget.likes.isNotEmpty) {
      count = int.parse(widget.likes.toString());
    }

    var like = NumberFormat.decimalPattern().format(count);

    widget.createdAt.toInt() > 7 == true
        ? created = widget.createdAt.toInt() / 7.0
        : created = widget.createdAt.toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFeedsHeader(),
        widget.imageUrl != null
            ? Image.network(widget.imageUrl ?? '', fit: BoxFit.contain)
            : Image.asset('assets/images/noavatar.png'),
        buildFeedsFooter(like),
        buildFeedsCaption(),
        widget.createdAt.toInt() > 7
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${created.toInt()} weeks ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: commentGrey,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${created.toInt()} days ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: commentGrey,
                  ),
                ),
              ),
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
              width: 34,
              height: 34,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    widget.avatarUrl ?? 'assets/images/noavatar.png',
                  ),
                ),
              ),
              clipBehavior: Clip.antiAlias,
            ),
            Text(
              widget.username,
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
            onTap: () => SnackbarUtils.showFeedInDevelopment(),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 22,
            ),
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
          children: [buildStartFooterMenu()],
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

                SnackbarUtils.showLikeInDevelopment();
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
            onTap: () => SnackbarUtils.showCommentInDevelopment(),
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
            onTap: () => SnackbarUtils.showSendToDM(),
            child: Image.asset(
              'assets/images/ic_send.png',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Column buildFeedsCaption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  text: '${widget.captions} ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        buildFeedsComments(
          widget.commentCount,
          widget.comments,
          widget.commentBy,
        ),
      ],
    );
  }

  Widget buildFeedsComments(
    int? commentCount,
    String? lastComment,
    String? lastCommenter,
  ) {
    return GestureDetector(
      onTap: () async {
        SnackbarUtils.showCommentInDevelopment();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commentCount != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    'View all ${commentCount - 1} comments',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: commentGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Container(),
                ),
          Row(
            children: [
              lastCommenter != null
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 4, left: 8, bottom: 4),
                      child: Text(
                        '${lastCommenter.toString()} ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: bgLightMode,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 4, left: 8, bottom: 4),
                      child: Container(),
                    ),
              lastComment != null
                  ? Text(
                      '${lastComment.toString()}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: bgLightMode,
                        fontSize: 14,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Container(),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
