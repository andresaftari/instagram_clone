part of '../pages.dart';

class DiscoveryPageViews extends StatefulWidget {
  const DiscoveryPageViews({Key? key}) : super(key: key);

  @override
  _DiscoveryPageViewsState createState() => _DiscoveryPageViewsState();
}

class _DiscoveryPageViewsState extends State<DiscoveryPageViews> {
  final DiscoveryController _discoveryController = Get.find();

  late Future<List<Discovery>> listDiscovery;

  @override
  void initState() {
    listDiscovery = _discoveryController.getDiscoveryFeeds();
    super.initState();
  }

  Future _onRefresh() async {
    await _discoveryController.getDiscoveryFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkMode,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Obx(
              () {
                return _discoveryController.discoveryObsList.isEmpty
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
                        onRefresh: _onRefresh,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: GestureDetector(
                                child: SearchViews(),
                                onTap: () {
                                  SnackbarUtils.showDiscoverySearchInDevelopment();
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                SnackbarUtils.showDiscoveryFeedsInDevelopment();
                              },
                              child: buildDiscoveryGridViews(),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDiscoveryGridViews() {
    return FutureBuilder<List<Discovery>>(
        future: listDiscovery,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var discoveryList = snapshot.data!;
            // print('Discovery: Views Passed');

            List<Widget> cardList = [];

            for (var element in discoveryList) {
              if (element.id > 1) {
                cardList.add(
                  DiscoveryCard(
                    isPhoto: element.isPhoto,
                    isReels: element.isReels,
                    isSlideshow: element.isSlideshows,
                    contentUrl: element.contentUrl,
                    index: element.id - 1,
                    width: MediaQuery.of(context).size.width.toInt(),
                    height: 120,
                  ),
                );
              } else {
                cardList.add(
                  DiscoveryCard(
                    isPhoto: element.isPhoto,
                    isReels: element.isReels,
                    isSlideshow: element.isSlideshows,
                    contentUrl: element.contentUrl,
                    index: element.id - 1,
                    width: MediaQuery.of(context).size.width.toInt(),
                    height: 320,
                  ),
                );
              }
            }

            return StaggeredGrid.count(crossAxisCount: 2, children: cardList);
          } else {
            return Center(child: Text('No Data...'));
          }
        });
  }
}
