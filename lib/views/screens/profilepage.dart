import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auksion_app/views/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.all(20),
            child: ZoomTapAnimation(
              onTap: () async {
                SharedPreferences sharedpref =
                    await SharedPreferences.getInstance();
                sharedpref.remove('userData');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Loginpage();
                    },
                  ),
                );
              },
              child: Icon(Icons.logout),
            ),
          ),
          IconButton(
              onPressed: () async {
                final themeode = await AdaptiveTheme.getThemeMode();
                if (themeode == AdaptiveThemeMode.dark) {
                  isDark = !isDark;
                  AdaptiveTheme.of(context).setLight();
                } else {
                  isDark = !isDark;
                  AdaptiveTheme.of(context).setDark();
                }
              },
              icon: isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode))
        ],
      ),
      body:const Column(children: [
        Padding(padding: EdgeInsets.all(20))
      ],),
    );
  }
}
