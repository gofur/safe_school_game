class Game {
  final String url;
  final String image;
  final String icon;
  final String title;
  final String author;
  final String description;
  final double difficult;
  final double educationContent;
  final String ageUse;
  final List<GameImages> images;

  Game(
      {required this.url,
      required this.image,
      required this.icon,
      required this.title,
      required this.author,
      required this.description,
      required this.difficult,
      required this.educationContent,
      required this.ageUse,
      required this.images});
}

class GameImages {
  final String images;

  GameImages({required this.images});
}
