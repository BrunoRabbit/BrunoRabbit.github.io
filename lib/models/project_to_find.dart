enum ProjectToFind {
  pomodoroTimer,
  moviesApi,
  calculatorFlutter,
  name4,
  name5,
}

extension ProjectToFindExtension on ProjectToFind {
  String get name {
    switch (this) {
      case ProjectToFind.pomodoroTimer:
        return 'pomodoro-timer';
      case ProjectToFind.moviesApi:
        return 'movies-api';
      case ProjectToFind.calculatorFlutter:
        return 'calculator-flutter';
      default:
        return 'Not found';
    }
  }

  static ProjectToFind fromString(String value) {
    switch (value) {
      case 'pomodoro-timer':
        return ProjectToFind.pomodoroTimer;
      case 'movies-api':
        return ProjectToFind.moviesApi;
      case 'calculator-flutter':
        return ProjectToFind.calculatorFlutter;
      default:
        throw ArgumentError('Invalid ProjectToFind: $value');
    }
  }

  String get imagePath {
    switch (this) {
      case ProjectToFind.pomodoroTimer:
        return 'assets/images/repo_images/pomodoro/pomodoro_image.png';
      case ProjectToFind.moviesApi:
        return 'assets/images/repo_images/movie/movie_image.png';
      case ProjectToFind.calculatorFlutter:
        return 'assets/images/no_found_image.svg';
      case ProjectToFind.name4:
      case ProjectToFind.name5:
        return '';
      default:
        return 'default_image_path';
    }
  }
}