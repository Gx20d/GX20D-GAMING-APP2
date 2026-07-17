class VideoModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String youtubeUrl;
  final String thumbnail;
  final String duration;
  final int views;
  final int likes;
  final String uploadDate;

  VideoModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.youtubeUrl,
    required this.thumbnail,
    required this.duration,
    required this.views,
    required this.likes,
    required this.uploadDate,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: int.parse(json["id"].toString()),
      categoryId: int.parse(json["category_id"].toString()),
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      youtubeUrl: json["youtube_url"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      duration: json["duration"] ?? "",
      views: int.tryParse(json["views"].toString()) ?? 0,
      likes: int.tryParse(json["likes"].toString()) ?? 0,
      uploadDate: json["upload_date"] ?? "",
    );
  }
}