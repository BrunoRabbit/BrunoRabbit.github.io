class Owner {
  const Owner({
    required this.ownerName,
    required this.avatarUrl,
  });

  final String ownerName;
  final String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      ownerName: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}
