part of '../pages.dart';

class DiscoveryPageViews extends StatefulWidget {
  const DiscoveryPageViews({Key? key}) : super(key: key);

  @override
  _DiscoveryPageViewsState createState() => _DiscoveryPageViewsState();
}

class _DiscoveryPageViewsState extends State<DiscoveryPageViews> {
  final _pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkMode,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SearchViews(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildDiscoveryGridViews() {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: _pattern,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {

        },
      ),
    );
  }
}
