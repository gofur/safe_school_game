class Game {
  final String url;
  final String image;
  final String icon;
  final String title;
  final String author;
  final String description;
  final String difficult;
  final String educationContent;
  final String reference;
  final String shortInformation;
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
      required this.reference,
      required this.shortInformation,
      required this.images});
}

class GameImages {
  final String images;

  GameImages({required this.images});
}
