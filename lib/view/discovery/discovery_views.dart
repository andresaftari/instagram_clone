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
                        child: buildDiscoveryBody(),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDiscoveryBody() {
    return Column(
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
              var width = element.isReels ? 240 : 120;
              var height = element.isReels ? 240 : 120;

              cardList.add(
                DiscoveryCard(
                  isPhoto: element.isPhoto,
                  isReels: element.isReels,
                  isSlideshow: element.isSlideshows,
                  contentUrl: element.contentUrl,
                  index: element.id - 1,
                  width: width,
                  height: height,
                ),
              );
            }

            return StaggeredGrid.count(crossAxisCount: 3, children: cardList);
          } else {
            return Center(child: Text('No Data...'));
          }
        });
  }

  // Widget buildDiscoveryGridTile() {
  //   return FutureBuilder<List<Discovery>>(
  //     future: listDiscovery,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         var discoveryList = snapshot.data!;
  //
  //         print(discoveryList.toString());
  //
  //         return Container(
  //           width: MediaQuery.of(context).size.width,
  //           height: MediaQuery.of(context).size.height,
  //           child: GridView.custom(
  //             gridDelegate: SliverQuiltedGridDelegate(
  //               repeatPattern: QuiltedGridRepeatPattern.inverted,
  //               crossAxisCount: discoveryList.length - 1,
  //               pattern: const [
  //                 QuiltedGridTile(2, 2),
  //                 QuiltedGridTile(1, 1),
  //                 QuiltedGridTile(1, 1),
  //                 QuiltedGridTile(1, 2),
  //               ],
  //             ),
  //             childrenDelegate: SliverChildBuilderDelegate(
  //               (context, index) {
  //                 return DiscoveryCard(
  //                   isPhoto: discoveryList[index].isPhoto,
  //                   isReels: discoveryList[index].isReels,
  //                   isSlideshow: discoveryList[index].isSlideshows,
  //                   contentUrl: discoveryList[index].contentUrl,
  //                   index: index,
  //                   width: MediaQuery.of(context).size.width.toInt(),
  //                   height: 400,
  //                 );
  //               },
  //               childCount: discoveryList.length,
  //             ),
  //           ),
  //         );
  //       } else {
  //         return Center(child: Text('No Data...'));
  //       }
  //     },
  //   );
  // }
}
