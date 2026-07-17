class ContentModel {
  final int id;
  final String gameName;
  final String image;
  final String description;
  final String platform;
  final String link;

  ContentModel({
    required this.id,
    required this.gameName,
    required this.image,
    required this.description,
    required this.platform,
    required this.link,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: int.parse(json['id'].toString()),
      gameName: json['game_name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      platform: json['platform'] ?? '',
      link: json['link'] ?? '',
    );
  }
}