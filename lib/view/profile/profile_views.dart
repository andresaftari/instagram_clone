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
          buildProfileBio(),
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

  Container buildProfileBio() {
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
}
