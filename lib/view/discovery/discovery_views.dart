part of '../pages.dart';

class DiscoveryPageViews extends StatefulWidget {
  const DiscoveryPageViews({Key? key}) : super(key: key);

  @override
  _DiscoveryPageViewsState createState() => _DiscoveryPageViewsState();
}

class _DiscoveryPageViewsState extends State<DiscoveryPageViews> {
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
}
