import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutternote/profile/profile_page.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  "assets/images/img_back_setting.svg",
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(170),
                        child: Image.network(
                          'https://canthoplus.com/wp-content/uploads/2022/04/2-tinh-nghe-an-thuoc-mien-nao-cua-viet-nam-bien-dien-thanh.jpg',
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          height: 170,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),

          Text(
            "Puerto Rico",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "youremail@domain.com | +01 234 567 89",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_profile.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Edit profile information")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_notification.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Notifications"),
                      Text("ON"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_language.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Language")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_security.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Security")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_theme.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Theme")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_help.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Help & Support")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_contact.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Contact us")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/icon_setting_privacy.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Privacy policy")
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
