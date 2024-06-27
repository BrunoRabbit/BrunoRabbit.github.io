import 'package:flutter/material.dart';
import '../models/git_info.dart';
import '../models/project_to_find.dart';
import '../services/repository_service.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class HomePageViewModel extends ChangeNotifier {
  final ReposService service = ReposService();
  List<GitInfo?> gitInfos = [];
  List<GitInfo?> filteredGitInfos = [];
  List<String> namesToFind = [
    ProjectToFind.pomodoroTimer.name,
    ProjectToFind.moviesApi.name,
    ProjectToFind.calculatorFlutter.name,
  ];

  int myAge = 0;
  String selectedText = "Copiar";
  List<bool> isMouseEnter = [];

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

  String findMyAge() {
    final today = DateTime.now();
    int myAge = today.year - 1;

    if (today.month == 12 && today.day > 6) {
      myAge += 1;
    }

    return myAge.toString().replaceRange(0, 2, '');
  }

  void changeText() {
    if (!selectedText.contains('Copiar')) {
      selectedText = 'Copiar';
    }

    if (selectedText.contains('Copiar')) {
      selectedText = 'Copiado!';
    }

    notifyListeners();
  }

  void isMouseHover(bool isHover, int index) {
    isMouseEnter[index] = isHover;
    notifyListeners();
  }

  void isUserCopiedEmail(bool isHover) {
    if (!isHover) {
      Future.delayed(const Duration(milliseconds: 300), () {
        selectedText = 'Copiar';
      });
    }
    notifyListeners();
  }

  Future<void> getRepoInfo() async {
    gitInfos = await service.getRepoInfo(1);
    gitInfos.addAll(await service.getRepoInfo(2));
    notifyListeners();
  }

  Future<void> filterRepoInfo() async {
    isMouseEnter = List<bool>.filled(namesToFind.length, false);
    filteredGitInfos = gitInfos
        .where((gitInfo) => namesToFind.contains(gitInfo!.repositoryInfo.name))
        .toList();

    notifyListeners();
  } // flutter run -d chrome --web-browser-flag "--disable-web-security"

  String formatTitle(String item) {
    String title = item;

    if (RegExp(r'[-_]').hasMatch(item)) {
      title = item.replaceAll('-', ' ').replaceAll('_', ' ');
    }

    return title[0].toUpperCase() +
        title.substring(1, title.length).toLowerCase();
  }
}
