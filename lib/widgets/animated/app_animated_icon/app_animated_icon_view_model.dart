import 'package:flutter/material.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class AppAnimatedIconViewModel extends ChangeNotifier {
  Map<IconData, double> paddingMap = {};

  void updateIconPadding(IconData icon) {
    paddingMap[icon] = 30;
    notifyListeners();
  }

  void posUpdateIconPadding(IconData icon) {
    paddingMap[icon] = 0;
    notifyListeners();
  }

  Future<void> launchInBrowser(String url) async {
    if (!await UrlLauncherPlatform.instance.canLaunch(url)) {
      throw Exception('Could not launch $url');
    }

    await UrlLauncherPlatform.instance.launch(
      url,
      useSafariVC: false,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: <String, String>{},
    );
  }
}
