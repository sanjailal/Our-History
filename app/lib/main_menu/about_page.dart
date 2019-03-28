import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:timeline/colors.dart';
import 'package:url_launcher/url_launcher.dart';

/// This widget is visible when opening the about page from the [MainMenuWidget].
/// 
/// It displays all the information about the development of the application, 
/// the inspiration sources and tools and SDK used throughout the development process.
/// 
/// This page uses the package `url_launcher` available at https://pub.dartlang.org/packages/url_launcher
/// to open up urls in a WebView on both iOS & Android.
class AboutPage extends StatelessWidget {
  /// Sanity check before opening up the url.
  _launchUrl(String url) {
    canLaunch(url).then((bool success) {
      if (success) {
        launch(url);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: lightGrey,
          iconTheme: IconThemeData(color: Colors.black.withOpacity(0.54)),
          elevation: 0.0,
          leading: IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            color: Colors.black.withOpacity(0.5),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          titleSpacing:
              9.0, // Note that the icon has 20 on the right due to its padding, so we add 10 to get our desired 29
          title: Text("About",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: "RobotoMedium",
                  fontSize: 20.0,
                  color: darkText.withOpacity(darkText.opacity * 0.75))),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Our History",
                style: TextStyle(
                    fontFamily: "RobotoMedium",
                    fontSize: 34.0,
                    color: darkText.withOpacity(darkText.opacity * 0.75)),
              ),
              
              
              
              Text(
                "Built with",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 17.0,
                    height: 4.5,
                    color: Colors.black.withOpacity(0.5)),
              ),
              GestureDetector(
                onTap: () => _launchUrl("https://www.flutter.io"),
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/flutter_logo.png",
                              height: 45.0, width: 37.0),
                          Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Flutter",
                              style: TextStyle(
                                  fontSize: 26.0,
                                  color: darkText
                                      .withOpacity(darkText.opacity * 0.6)),
                            ),
                          )
                        ])),
              )
            ],
          ),
        ));
  }
}
