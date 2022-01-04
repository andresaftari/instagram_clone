part of '../pages.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  _HomePageViewsState createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final HomeController _homeController = Get.find();

  late Future<List<UserStory>> listStory;

  @override
  void initState() {
    listStory = _homeController.getUserStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: bgDarkMode,
      appBar: HomeAppbar(),
      body: RefreshIndicator(
        displacement: 0.1,
        color: Colors.transparent,
        backgroundColor: Colors.transparent,
        strokeWidth: 0.1,
        onRefresh: () async {
          _homeController.getUserStories();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 2),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              buildListStory(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildListStory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.snackbar(
                'Story',
                'Masih dalam pengembangan',
              ),
              child: Container(
                padding: EdgeInsets.only(top: 4),
                child: CurrentStoryCard(
                  username: 'Your Story',
                  avatarURL: 'assets/images/andre.png',
                ),
              ),
            ),
            FutureBuilder<List<UserStory>>(
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
                          return GestureDetector(
                            onTap: () => Get.snackbar(
                              'Story',
                              'Masih dalam pengembangan',
                            ),
                            child: UserStoryCard(
                              username: story?[i].username,
                              avatarURL: story?[i].avatarURL,
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
