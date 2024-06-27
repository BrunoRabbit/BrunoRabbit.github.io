import 'dart:convert';

import 'package:http/http.dart';
import '../http_manager.dart';
import '../models/git_info.dart';

class ReposService {
  Future<List<GitInfo?>> getRepoInfo(int page) async {
    final request = HttpManager(
      url: 'https://api.github.com/users/BrunoRabbit/repos?page=$page',
    );

    try {
      Response response = await request.get();

      final responseData = jsonDecode(response.body);

      return (responseData as List<dynamic>)
          .map((gitInfo) => GitInfo.fromJson(gitInfo))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
