import 'package:final_round/src/ui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final List<String> imgList = [
  'lib/src/assets/images/layer1.png',
  'lib/src/assets/images/layer2.png',
  'lib/src/assets/images/layer3.png',
  'lib/src/assets/images/layer4.png',
  'lib/src/assets/images/layer5.png',
  'lib/src/assets/images/layer6.png',
  'lib/src/assets/images/layer7.png',
  'lib/src/assets/images/layer8.png',
  'lib/src/assets/images/video1.png',
  'lib/src/assets/images/video2.png',
  'lib/src/assets/images/layer1.png',
  'lib/src/assets/images/layer2.png',
  'lib/src/assets/images/layer3.png',
  'lib/src/assets/images/layer4.png',
  'lib/src/assets/images/layer5.png',
  'lib/src/assets/images/layer6.png',
  'lib/src/assets/images/layer7.png',
  'lib/src/assets/images/layer8.png',
  'lib/src/assets/images/video1.png',
  'lib/src/assets/images/video2.png',
];

class HomeScreen extends StatefulWidget {
  static String route = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController();
  bool closeMainController = false;
  double height, width, _scale;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeMainController = controller.offset > 50;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: Color(0xff1c1d1d),
      body: SafeArea(
        child: _buildTabWidget(),
        //child: _buildProfileWidget(),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return FittedBox(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: Hero(tag: 'hero-tag', child: _buildUserProfile())),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildTextWidget(
              mainText: 'Samantha Smith', subText: '@iamsamanthasmith'),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                _buildTextWidget(mainText: '1.2m', subText: 'Liked'),
                SizedBox(
                  width: 50,
                ),
                _buildTextWidget(mainText: '12.8k', subText: 'Followers'),
                SizedBox(
                  width: 50,
                ),
                _buildTextWidget(mainText: '1.9k', subText: 'Following'),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTextWidget({@required String mainText, @required String subText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              '$mainText',
              style: TextStyle(
                  fontSize: Size.heading,
                  color: Colour.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '$subText',
              style: TextStyle(
                  fontSize: Size.subContent,
                  color: Colour.white.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildUserProfile() {
    return Container(
      height: 80,
      child: ClipOval(
        child: Image.asset('lib/src/assets/images/user_profile.jpg'),
      ),
    );
  }

  Widget _buildTabWidget() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: _buildTabBarScreen(),
      ),
    );
  }

  Widget _buildTabBarScreen() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: width,
                alignment: Alignment.topCenter,
                height: closeMainController ? 0 : height / 2.75,
                child: _buildProfileWidget(),
              ),
              _buildAppBarTab(),
              Container(
                height: closeMainController ? height : height / 2,
                child: _buildTabBarBody(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAppBarTab() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(closeMainController ? 0 : 30.0),
            topRight: Radius.circular(closeMainController ? 0 : 30.0),
          ),
          color: Colour.black.withOpacity(0.5)),
      child: TabBar(
        labelColor: Colour.white,
        indicatorColor: Colour.white,
        tabs: [
          Tab(
            child: Image.asset(
              'lib/src/assets/icons/feed.png',
              height: 20,
            ),
          ),
          Tab(
            child: Image.asset(
              'lib/src/assets/icons/like.png',
              height: 20,
            ),
          ),
          Tab(
            child: Image.asset(
              'lib/src/assets/icons/saved.png',
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarBody() {
    return TabBarView(
      children: <Widget>[
        _buildGridViewWidget(),
        _buildGridViewWidget(),
        _buildGridViewWidget(),
      ],
    );
  }

  Widget _buildGridViewWidget() {
    return GridView.builder(
        controller: controller,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Image.asset(
              imgList[index],
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
