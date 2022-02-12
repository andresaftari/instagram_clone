import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showStoryInDevelopment() => Get.snackbar(
        'Story',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 1),
        colorText: Colors.white,
      );

  static void showFeedInDevelopment() => Get.snackbar(
        'Feed',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 1),
        colorText: Colors.white,
      );

  static void showLikeInDevelopment() => Get.snackbar(
        'Likes',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 1),
        colorText: Colors.white,
      );

  static void showCommentInDevelopment() => Get.snackbar(
        'Comments',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
        colorText: Colors.white,
      );

  static void showSendToDM() => Get.snackbar(
        'Send to DM',
        'Masih dalam pengembangan',
        duration: Duration(seconds: 2),
        colorText: Colors.white,
      );

  static void showDiscoveryFeedsInDevelopment() => Get.snackbar(
    'Discovery Feeds',
    'Masih dalam pengembangan',
    duration: Duration(seconds: 2),
    colorText: Colors.white,
  );

  static void showDiscoverySearchInDevelopment() => Get.snackbar(
    'Discovery Search',
    'Masih dalam pengembangan',
    duration: Duration(seconds: 2),
    colorText: Colors.white,
  );

  static void showDebug(output, message, tag) => Get.snackbar(
        tag,
        '$message: $output',
        duration: Duration(seconds: 1),
        colorText: Colors.white,
      );
}
