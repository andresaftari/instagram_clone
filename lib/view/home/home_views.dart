part of '../pages.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  _HomePageViewsState createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final HomeController _homeController = Get.find();

  late Future<List<UserStory>> listStory;
  late Future<List<Feeds>> listFeeds;

  String? avatar = '';

  @override
  void initState() {
    listStory = _homeController.getUserStories();
    listFeeds = _homeController.getFeeds();
    super.initState();
  }

  Future _refreshFeed() async {
    await _homeController.getUserStories();
    await _homeController.getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HomeAppbar(),
      backgroundColor: bgDarkMode,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: _refreshFeed,
            child: buildHomeBody(),
          ),
        ),
      ),
    );
  }

  Container buildHomeBody() {
    return Container(
      padding: EdgeInsets.only(top: 4),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 160,
      child: FutureBuilder<List<Feeds>>(
        future: listFeeds,
        builder: (context, snapshot) {
          var feedList = snapshot.data;

          return ListView.builder(
              shrinkWrap: true,
              itemCount: feedList?.length,
              itemBuilder: (context, i) {
                var feed = feedList?[i];

                if (i > 0) {
                  return FeedsCard(
                    id: feed?.id,
                    username: feed?.username,
                    avatarUrl: feed?.avatarURL,
                    imageUrl: feed?.imageURL,
                    likes: feed?.likeCount,
                    captions: feed?.captions,
                    comments: feed?.comments,
                    commentBy: feed?.commentBy,
                    commentCount: feed?.commentCount,
                    createdAt: feed?.createdAt,
                  );
                } else {
                  return buildListStory();
                }
              });
        },
      ),
    );
  }

  Container buildListStory() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: FutureBuilder<List<UserStory>>(
          future: listStory,
          builder: (context, snapshot) {
            var storyList = snapshot.data;

            return ListView.builder(
                shrinkWrap: true,
                itemCount: storyList?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  if (i > 0) {
                    return GestureDetector(
                      onTap: () => SnackbarUtils.showStoryInDevelopment(),
                      child: UserStoryCard(
                        username: storyList?[i].username,
                        avatarURL: storyList?[i].avatarURL,
                      ),
                    );
                  } else {
                    return CurrentStoryCard(
                      username: 'Your Story',
                      avatarURL: 'assets/images/andre.png',
                    );
                  }
                });
          },
        ));
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     extendBody: true,
//     backgroundColor: bgDarkMode,
//     appBar: HomeAppbar(),
//     body: Obx(
//       () => _homeController.feedsObsList.isEmpty
//           ? Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.blueAccent,
//               ),
//             )
//           : RefreshIndicator(
//               displacement: 0.1,
//               color: Colors.transparent,
//               backgroundColor: Colors.transparent,
//               strokeWidth: 0.1,
//               onRefresh: _refreshFeed,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: double.infinity,
//                 margin: EdgeInsets.only(top: 2),
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   children: [
//                     buildListStory(),
//                     buildListFeeds(),
//                   ],
//                 ),
//               ),
//             ),
//     ),
//   );
// }
//
// Container buildListStory() {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 8),
//     width: double.infinity,
//     child: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: FutureBuilder<List<UserStory>>(
//           future: listStory,
//           builder: (context, snapshot) {
//             var story = snapshot.data;
//
//             return Container(
//               padding: EdgeInsets.only(top: 4, right: 4),
//               width: MediaQuery.of(context).size.width,
//               height: 85,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: story?.length,
//                   itemBuilder: (context, i) {
//                     if (i > 0) {
//                       return GestureDetector(
//                         onTap: () => SnackbarUtils.showStoryInDevelopment(),
//                         child: UserStoryCard(
//                           username: story?[i].username,
//                           avatarURL: story?[i].avatarURL,
//                         ),
//                       );
//                     } else {
//                       return CurrentStoryCard(
//                         username: 'Your Story',
//                         avatarURL: 'assets/images/andre.png',
//                       );
//                     }
//                   }),
//             );
//           }),
//     ),
//   );
// }
//
// Container buildListFeeds() {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 8),
//     width: MediaQuery.of(context).size.width,
//     child: FutureBuilder<List<Feeds>>(
//         future: listFeeds,
//         builder: (context, snapshot) {
//           var feeds = snapshot.data;
//
//           return Container(
//             padding: EdgeInsets.only(top: 4, right: 4),
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 240,
//             child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: feeds?.length,
//                 itemBuilder: (context, i) {
//                   print(i);
//
//                   return FeedsCard(
//                     id: feeds?[i].id,
//                     username: feeds?[i].username,
//                     avatarUrl: feeds?[i].avatarURL,
//                     imageUrl: feeds?[i].imageURL,
//                     likes: feeds?[i].likeCount,
//                     captions: feeds?[i].captions,
//                     comments: feeds?[i].comments,
//                     commentBy: feeds?[i].commentBy,
//                     commentCount: feeds?[i].commentCount,
//                     createdAt: feeds?[i].createdAt,
//                   );
//                 }),
//           );
//         }),
//   );
// }
}
