import 'dart:convert';

import 'package:http/http.dart';
import '../http_manager.dart';
import '../models/git_info.dart';

class ReposService {
  Future<List<GitInfo?>> getRepoInfo() async {
    final request = HttpManager(
      url: 'http://localhost:3000/user',
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
