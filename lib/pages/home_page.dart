import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_ui_app/json/home_video.dart';
import 'package:youtube_ui_app/pages/video_detail_page.dart';
import 'package:youtube_ui_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b1c1e),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/youtube.svg",
                width: 35,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: const Icon(
                        LineIcons.videoAlt,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(LineIcons.search, color: Colors.white),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(LineIcons.bell, color: Colors.white),
                      onPressed: () {}),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/profile.jpeg",
                          ),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: List.generate(home_video.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VideoDetailPage(
                                      title: home_video[index]['title'],
                                      viewCount: home_video[index]
                                          ['view_count'],
                                      username: home_video[index]['username'],
                                      profile: home_video[index]['profile_img'],
                                      thumbnail: home_video[index]
                                          ['thumnail_img'],
                                      dayAgo: home_video[index]['day_ago'],
                                      subscribeCount: home_video[index]
                                          ['subscriber_count'],
                                      likeCount: home_video[index]
                                          ['like_count'],
                                      unlikeCount: home_video[index]
                                          ['unlike_count'],
                                      videoUrl: home_video[index]['video_url'],
                                    )));
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                    home_video[index]['thumnail_img']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      home_video[index]['profile_img']),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: size.width - 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                home_video[index]['title'],
                                style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: size.width - 120,
                                    child: Text(
                                      home_video[index]['username'] +
                                          " - " +
                                          home_video[index]['day_ago'] +
                                          " - " +
                                          home_video[index]['view_count'],
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: white.withOpacity(0.4),
                                          fontSize: 12,
                                          height: 1.5),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Icon(
                          LineIcons.verticalEllipsis,
                          color: white.withOpacity(0.4),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
