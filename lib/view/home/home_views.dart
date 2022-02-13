part of '../pages.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  _HomePageViewsState createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  String? avatar = '';
  late Future<List<UserStory>> listStory;
  late Future<List<Feeds>> listFeeds;

  late Future<List<Feeds>> listTest;

  final HomeController _homeController = Get.find();

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
          child: Obx(
            () {
              return _homeController.feedsObsList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Loading Data...'),
                          SizedBox(height: 8),
                          CircularProgressIndicator.adaptive(),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _refreshFeed,
                      child: buildHomeBody(),
                    );
            },
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
          if (snapshot.hasData) {
            var feedList = snapshot.data!;

            return ListView.builder(
                shrinkWrap: true,
                itemCount: feedList.length,
                itemBuilder: (context, i) {
                  var feed = feedList[i];
                  // print('Feeds: Views Passed');

                  if (i > 0) {
                    return FeedsCard(
                      id: feed.id,
                      username: feed.username,
                      avatarUrl: feed.avatarURL,
                      imageUrl: feed.imageURL,
                      likes: feed.likeCount,
                      captions: feed.captions,
                      comments: feed.comments,
                      commentBy: feed.commentBy,
                      commentCount: feed.commentCount,
                      createdAt: feed.createdAt,
                    );
                  } else {
                    return buildListStory();
                  }
                });
          } else {
            return Center(
              child: Text('No Data...'),
            );
          }
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
            if (snapshot.hasData) {
              var storyList = snapshot.data!;
              // print('Story: Views Passed');

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: storyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    if (i > 0) {
                      return GestureDetector(
                        onTap: () => SnackbarUtils.showStoryInDevelopment(),
                        child: UserStoryCard(
                          username: storyList[i].username,
                          avatarURL: storyList[i].avatarURL,
                        ),
                      );
                    } else {
                      return CurrentStoryCard(
                        username: 'Your Story',
                        avatarURL: 'assets/images/andre.png',
                      );
                    }
                  });
            } else {
              return Center(
                child: Text('No Data...'),
              );
            }
          },
        ));
  }
}
