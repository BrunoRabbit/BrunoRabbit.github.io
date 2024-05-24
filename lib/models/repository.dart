class Repository {
  final String name;
  final String fullName;
  final bool isPrivate;
  final String htmlUrl;
  final String? description;
  final String language;
  // List<Topics> topics;

  Repository({
    required this.name,
    required this.fullName,
    required this.isPrivate,
    required this.htmlUrl,
    required this.description,
    required this.language,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      fullName: json['full_name'],
      isPrivate: json['private'],
      htmlUrl: json['html_url'],
      // phone: (json['phones'] as List).map((e) => Phone.fromJson(e)).toList(),
      // address: Address.fromJson(json['address']),
      description: json['description'] ?? "",
      language: json['language'],
    );
  }
}
