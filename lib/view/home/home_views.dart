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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkMode,
      appBar: HomeAppbar(),
      body: Obx(
        () => _homeController.feedsObsList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),
              )
            : RefreshIndicator(
                displacement: 0.1,
                color: Colors.transparent,
                backgroundColor: Colors.transparent,
                strokeWidth: 0.1,
                onRefresh: () async {
                  _homeController.getUserStories();
                  _homeController.getFeeds();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 2),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildListStory(),
                        buildListFeeds(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Container buildListStory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: FutureBuilder<List<UserStory>>(
          future: listStory,
          builder: (context, snapshot) {
            var story = snapshot.data;

            return Container(
              padding: EdgeInsets.only(top: 4, right: 4),
              width: MediaQuery.of(context).size.width,
              height: 85,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: story?.length,
                  itemBuilder: (context, i) {
                    if (i > 0) {
                      return GestureDetector(
                        onTap: () => SnackbarUtils.showStoryInDevelopment(),
                        child: UserStoryCard(
                          username: story?[i].username,
                          avatarURL: story?[i].avatarURL,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () => SnackbarUtils.showStoryInDevelopment(),
                        child: CurrentStoryCard(
                          username: 'Your Story',
                          avatarURL: 'assets/images/andre.png',
                        ),
                      );
                    }
                  }),
            );
          }),
    );
  }

  Container buildListFeeds() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Feeds>>(
          future: listFeeds,
          builder: (context, snapshot) {
            var feeds = snapshot.data;

            return Container(
              padding: EdgeInsets.only(top: 4, right: 4),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: feeds?.length,
                  itemBuilder: (context, i) {
                    print(i);

                    avatar =
                        feeds?[0].avatarURL ?? 'assets/images/noavatar.png';

                    return FeedsCard(
                      id: feeds?[i].id,
                      username: feeds?[i].username,
                      avatarUrl: feeds?[i].avatarURL,
                      imageUrl: feeds?[i].imageURL,
                      likes: feeds?[i].likeCount,
                      comments: feeds?[i].comments,
                    );
                  }),
            );
          }),
    );
  }
}
