part of '../pages.dart';

class ProfilePageViews extends StatefulWidget {
  final String? avatarUrl;
  final String username, fullname;

  ProfilePageViews({
    Key? key,
    required this.username,
    required this.fullname,
    this.avatarUrl,
  }) : super(key: key);

  @override
  _ProfilePageViewsState createState() => _ProfilePageViewsState();
}

class _ProfilePageViewsState extends State<ProfilePageViews> {
  final ProfileController _profileController = Get.find();

  late Future listHighlight;

  @override
  void initState() {
    listHighlight = _profileController.getHighlight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: ProfileAppbar(username: '${widget.username}'),
      backgroundColor: bgDarkMode,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProfileData(),
          buildDummyProfileBio(),
          editProfileAction(),
          buildProfileHighlight(),
        ],
      ),
    );
  }

  Container buildProfileData() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.avatarUrl ?? 'assets/images/noavatar.png',
                ),
              ),
            ),
          ),
          buildProfileStats(),
        ],
      ),
    );
  }

  Row buildProfileStats() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '3',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Posts',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(width: 34),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '706',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Followers',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(width: 34),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '944',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Following',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Container buildDummyProfileBio() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.fullname}',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            'This is dummy bio of Andre Saftari, this app creator :)',
            maxLines: 4,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            'https://example.com/',
            maxLines: 4,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Padding editProfileAction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => SnackbarUtils.showEditProfileInDevelopment(),
            child: Center(
              child: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width - 80, 35),
              primary: bgDarkMode,
              side: BorderSide(color: actionFillColor),
              elevation: 0,
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => SnackbarUtils.showDiscoverPeopleInDevelopment(),
            child: Icon(
              Icons.person_add_outlined,
              color: Colors.white,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(35, 35),
              primary: bgDarkMode,
              side: BorderSide(color: actionFillColor),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Container buildProfileHighlight() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: FutureBuilder<dynamic>(
        future: listHighlight,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var highlightList = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: highlightList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                if (i < highlightList.length - 1) {
                  return ProfileHighlightCard(
                    title: highlightList[i].title,
                    thumbnail: highlightList[i].thumbnail,
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: actionFillColor),
                          image: DecorationImage(
                            image: AssetImage('assets/images/icon_add.png'),
                            colorFilter: ColorFilter.mode(
                              Colors.black,
                              BlendMode.luminosity,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('New', style: TextStyle(fontSize: 14)),
                    ],
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
