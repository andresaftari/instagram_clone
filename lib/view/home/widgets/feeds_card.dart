import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controller/home_controller.dart';

class FeedsCard extends StatefulWidget {
  final String? username, imageUrl, avatarUrl, likes;
  final int? id;

  FeedsCard({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.imageUrl,
    required this.likes,
  });

  @override
  _FeedsCardState createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> {
  final HomeController _homeController = Get.find();

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
              child: GestureDetector(
                onTap: () {
                  Get.snackbar('Test', 'Tapped id: ${widget.id}');
                },
                child: Image.asset(
                  widget.avatarUrl ?? 'assets/images/noavatar.png',
                ),
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
          children: [buildStartFooterMenu(widget.id)],
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              Text(
                widget.likes.toString(),
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

  Row buildStartFooterMenu(var id) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8, top: 8),
          child: Obx(
            () => GestureDetector(
              onTap: () {
                print('tapped ${widget.id}');
                _homeController.setFeedsLike(widget.id);
              },
              child: _homeController.isFeedLiked.value
                  ? Icon(Icons.favorite, size: 30, color: Colors.redAccent)
                  : Icon(Icons.favorite_outline, size: 30),
            ),
          ),
        )
      ],
    );
  }
}
