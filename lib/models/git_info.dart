import 'owner.dart';
import 'repository.dart';

class GitInfo {
  GitInfo({
    required this.repositoryInfo,
    required this.ownerInfo,
    this.isComingSoon = false,
  });

  final Repository repositoryInfo;
  final Owner ownerInfo;
  final bool? isComingSoon;

  factory GitInfo.fromJson(Map<String, dynamic> json) {
    return GitInfo(
      ownerInfo: Owner.fromJson(json['owner']),
      repositoryInfo: Repository.fromJson(json),
    );
  }
}
