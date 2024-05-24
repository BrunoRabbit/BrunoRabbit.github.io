enum ProjectToFind {
  greatplacess,
  jokenpo,
  solidPrinciples,
  name4,
  name5,
}

extension ProjectToFindExtension on ProjectToFind {
  String get name {
    switch (this) {
      case ProjectToFind.greatplacess:
        return 'great-placess';
      case ProjectToFind.jokenpo:
        return 'joken-po';
      case ProjectToFind.solidPrinciples:
        return 'solid_principles';
      default:
        return 'Not found';
    }
  }

  static ProjectToFind fromString(String value) {
    switch (value) {
      case 'great-placess':
        return ProjectToFind.greatplacess;
      case 'joken-po':
        return ProjectToFind.jokenpo;
      case 'solid_principles':
        return ProjectToFind.solidPrinciples;
      default:
        throw ArgumentError('Invalid ProjectToFind: $value');
    }
  }

  String get imagePath {
    switch (this) {
      case ProjectToFind.greatplacess:
        return 'assets/images/repo_images/pomodoro/pomodoro_image.png';
      case ProjectToFind.jokenpo:
      case ProjectToFind.solidPrinciples:
      case ProjectToFind.name4:
      case ProjectToFind.name5:
        return '';
      default:
        return 'default_image_path';
    }
  }
}
