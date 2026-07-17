class GameModel {
  final int id;
  final String gameName;
  final String description;
  final String platform;
  final String image;
  final String link;

  GameModel({
    required this.id,
    required this.gameName,
    required this.description,
    required this.platform,
    required this.image,
    required this.link,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: int.parse(json["id"].toString()),
      gameName: json["game_name"] ?? "",
      description: json["description"] ?? "",
      platform: json["platform"] ?? "",
      image: json["image"] ?? "",
      link: json["link"] ?? "",
    );
  }
}